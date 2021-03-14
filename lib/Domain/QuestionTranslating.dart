import 'package:depression_diagnosis/Data/Entity/QuestionEntity.dart';
import 'package:depression_diagnosis/View/QuestionWidgetModel.dart';
import 'package:flutter/cupertino.dart';

abstract class QuestionTranslating {
  List<QuestionWidgetModel> translate(List<QuestionEntity> entities, Future<void> questionSelectionFinished(
      List<int> answerIndices,
      List<String> answerStrings,
      BuildContext context)) {}
}

class QuestionTranslator implements QuestionTranslating {
  List<QuestionWidgetModel> translate(
      List<QuestionEntity> entities,
      Future<void> questionSelectionFinished(
        List<int> answerIndices,
        List<String> answerStrings,
        BuildContext context
      )
     ) {

    List<QuestionWidgetModel> questionWidgetModels = entities.map((e) {
      List<String> answers = [];
      if (e.answer01.isNotEmpty);
      {
        answers.add(e.answer01);
      }
      if (e.answer02.isNotEmpty);
      {
        answers.add(e.answer02);
      }
      if (e.answer03.isNotEmpty);
      {
        answers.add(e.answer03);
      }
      if (e.answer04.isNotEmpty);
      {
        answers.add(e.answer04);
      }
      if (e.answer05.isNotEmpty);
      {
        answers.add(e.answer05);
      }
      if (e.answer06.isNotEmpty);
      {
        answers.add(e.answer06);
      }
      if (e.answer07.isNotEmpty);
      {
        answers.add(e.answer07);
      }
      if (e.answer08.isNotEmpty);
      {
        answers.add(e.answer08);
      }
      if (e.answer09.isNotEmpty);
      {
        answers.add(e.answer09);
      }
      if (e.answer10.isNotEmpty);
      {
        answers.add(e.answer10);
      }
      if (e.answer01.isNotEmpty);
      {
        answers.add(e.answer01);
      }

      QuestionWidgetModel model = QuestionWidgetModel(
          e.imageName, e.question, answers, e.maxSelectionCount
      );

      model.selectionFinished =
          (answerIndices, answerStrings, context) {
        questionSelectionFinished(
            answerIndices,
            answerStrings,
            context
        );
      };
    }).toList();

    return questionWidgetModels;
  }
}