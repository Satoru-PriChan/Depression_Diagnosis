import 'package:depression_diagnosis/Data/Entity/DiagnosisEntity.dart';
import 'package:depression_diagnosis/Data/Entity/DiagnosisResultEntity.dart';
import 'package:depression_diagnosis/Data/Entity/DiagnosisResultHistoryEntity.dart';
import 'package:depression_diagnosis/Data/Entity/QuestionEntity.dart';
import 'package:depression_diagnosis/Domain/AnswerTranslating.dart';
import 'package:depression_diagnosis/Domain/DiagnosisCalculating.dart';
import 'package:depression_diagnosis/Domain/QuestionTranslating.dart';
import 'package:depression_diagnosis/View/Diagnosis/DiagnosisWidget.dart';
import 'package:depression_diagnosis/View/DiagnosisResultModel.dart';
import 'package:depression_diagnosis/View/DiagnosisResultWidget.dart';
import 'package:depression_diagnosis/View/QuestionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Data/Util/DBClient.dart';
import 'Domain/DiagnosisResultHistoryRepository.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Future testDiagnosisResultHistoryRepository() async {
  DiagnosisResultHistoryRepository repo = DiagnosisResultHistoryRepository();
  var result = await repo.fetch(1);
  print("result: $result");
  await repo.add(1);
  var result2 = await repo.fetch(1);
  print("result2: $result2");
  await repo.add(2);
  var result3 = await repo.fetch(1);
  print("result3: $result3");
  await repo.add(1);
  var result4 = await repo.fetch(1);
  print("result4: $result4");
  await repo.add(3);
  var result5 = await repo.fetch(1);
  print("result5: $result5");
}

Future testDB() async {
  List<DiagnosisEntity> entities = await DBClient.query(DBObjectsStrategy.diagnosis);
  print("fetched entities ${entities}");
  List<QuestionEntity> questionEntities = await DBClient.query(DBObjectsStrategy.question, where: 'id = ?', whereArgs: [1]);
  print("fetched question entities ${questionEntities}");
  List<DiagnosisResultEntity> diagnosisResultEntites = await DBClient.query(DBObjectsStrategy.diagnosisResult);
  print("fetched diagnosis result entities ${diagnosisResultEntites}");
  await DBClient.add(DiagnosisResultHistoryEntity(1, "hahoho"));
  await DBClient.add(DiagnosisResultHistoryEntity(2, "hahoho"));
  List<DiagnosisResultHistoryEntity> diagnosisResultHistoryEntities = await DBClient.query(DBObjectsStrategy.diagnosisResultHistory);
  print("fetched diagnosisResultHistoryEntities: $diagnosisResultHistoryEntities");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return buildMyMaterialApp();
  }

  MaterialApp buildMyMaterialApp() {
    return MaterialApp(
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.cyan,
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: buildMaterialApp(),
  );
  }


  Widget buildMaterialApp() {
    return
      DiagnosisWidget(
        DiagnosisWidgetDependency(
          1,
          DepressionDiagnosisCalculator(),
          AnswerTranslator(),
          QuestionTranslator(),
          DiagnosisResultHistoryRepository(),
      )
     );
  }
/*
  List<Widget> buildTestDiagnosisResultWidget() {
    return <Widget>[
      DiagnosisResultWidget(
        model: DiagnosisResultModel(
          "タイトルテキスト",
          "リザルトテキストリザルトテキストリザルトテキストリザルトテキストリザルトテキストリザルトテキスト",
          "フレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキストフレーバーテキスト",
          [
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ),
            DiagnosisResultAnswerModel(
                "答え１",
                "回答１"
            ), DiagnosisResultAnswerModel(
              "答え１",
              "回答１"
          ), DiagnosisResultAnswerModel(
              "答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１答え１",
              "回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１回答１"
          ), DiagnosisResultAnswerModel(
              "答え１",
              "回答１"
          ), DiagnosisResultAnswerModel(
              "答え１",
              "回答１"
          ), DiagnosisResultAnswerModel(
              "答え１",
              "回答１"
          ),


          ],
          [
            DiagnosisResultPastResultModel(
              "2020/1/1",
              "ハハハ",
            )
          ],
        ),
      ),
    ];
  }

 */
}
