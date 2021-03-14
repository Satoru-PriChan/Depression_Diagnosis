import 'package:flutter/cupertino.dart';

class QuestionWidgetModel {
  String imageName;
  String question;
  List<String> answers;
  int maxSelectionCount = 1;
  Function(List<int>, List<String>, BuildContext) selectionFinished = (
      List<int> answerIndex,
      List<String> answerString,
      BuildContext context
      ){};

  QuestionWidgetModel(String imageName, String question, List<String> answers, int maxSelectionCount) {
    this.imageName = imageName;
        this.question = question;
    this.answers = answers;
    this.maxSelectionCount = maxSelectionCount;

  }
}