import 'dart:ffi';

import 'package:depression_diagnosis/Data/Entity/DiagnosisEntity.dart';
import 'package:depression_diagnosis/Data/Entity/QuestionEntity.dart';
import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Domain/AnswerTranslating.dart';
import 'package:depression_diagnosis/Domain/DiagnosisCalculating.dart';
import 'package:depression_diagnosis/Domain/DiagnosisResultHistoryRepository.dart';
import 'package:depression_diagnosis/Domain/QuestionTranslating.dart';
import 'package:depression_diagnosis/View/DiagnosisResultWidget.dart';
import 'package:depression_diagnosis/View/QuestionWidget.dart';
import 'package:depression_diagnosis/View/QuestionWidgetModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DiagnosisResultModel.dart';

class DiagnosisWidgetDependency {
  final int diagnosisID;
  final DiagnosisCalculating calculator;
  final AnswerTranslating answerTranslator;
  final QuestionTranslating questionTranslator;
  final DiagnosisResultHistoryRepositoryProtocol diagnosisResultHistoryRepository;

  DiagnosisWidgetDependency(
      this.diagnosisID,
      this.calculator,
      this.answerTranslator,
      this.questionTranslator,
      this.diagnosisResultHistoryRepository
      );
}

class DiagnosisWidget extends StatefulWidget {

  final DiagnosisWidgetDependency dependency;

  DiagnosisWidget(this.dependency);

  @override
  State<StatefulWidget> createState() => _DiagnosisState();
}

class _DiagnosisState extends State<DiagnosisWidget> {

  String diagnosisTitle = "";
  List<QuestionWidgetModel> questionWidgetModels = [];
  int currentQuestionIndex = 0;
  List<List<int>> answerIndicesList = [];
  List<List<String>> answerStringsList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeValues(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Loading...");
          default:
            return QuestionWidget(
             questionWidgetModels[0],
            );
        }
      },
    );
  }

  Future<Void> _initializeValues() async {
    //initialize instance values
    List<DiagnosisEntity> diagnosisEntities = await DBClient.query(
        DBObjectsStrategy.diagnosis,
        where: 'id = ?',
        whereArgs: [widget.dependency.diagnosisID]
    );
    DiagnosisEntity diagnosisEntity = diagnosisEntities.first;
    this.diagnosisTitle = diagnosisEntity.name;

    //initialize question data
    List<QuestionEntity> questionEntites = await DBClient.query(
      DBObjectsStrategy.question,
    );
    this.questionWidgetModels = widget.dependency.questionTranslator.translate(
        questionEntites,
        questionSelectionFinished
    );
  }

  /// QuestionWidgetで回答が終わった時に呼ばれる
  Future<void> questionSelectionFinished(
      List<int> answerIndices,
      List<String> answerStrings,
      BuildContext context) async {
    // indexを次の物へと更新
    currentQuestionIndex = currentQuestionIndex += 1;

    // ユーザーの答えを蓄積
    answerIndicesList.add(answerIndices);
    answerStringsList.add(answerStrings);

    if (currentQuestionIndex <= (questionWidgetModels.length - 1)) {
      //まだ質問が残っている場合: 次の質問を表示
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              QuestionWidget(
                  questionWidgetModels[currentQuestionIndex]
              ),
          )
      );
    } else {
      // もう質問が残っていない場合:
      //診断結果を計算
      CalculatedDiagnosisResult result = await widget.dependency.calculator.calculate(answerIndicesList, answerStringsList);
      //診断結果を保存
      await widget.dependency.diagnosisResultHistoryRepository.add(result.diagnosisResultID);
      //答えのデータの加工
      List<DiagnosisResultAnswerModel> answerModels = widget.dependency.answerTranslator.translate(
          questionWidgetModels.map((e) => e.question).toList(),
          answerStringsList
      );
      //過去の診断履歴の取得
      List<DiagnosisResultPastResultModel> diagnosisResultPastResultModels = await widget.dependency.diagnosisResultHistoryRepository.fetch(
        widget.dependency.diagnosisID
      );

      // 結果画面を表示
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              DiagnosisResultWidget(
                DiagnosisResultModel(
                  diagnosisTitle, //診断名
                  result.resultTxt,
                  result.flavorTxt,
                  answerModels,
                  diagnosisResultPastResultModels,
                ),
              ),
          )
      );
    }
  }
}
