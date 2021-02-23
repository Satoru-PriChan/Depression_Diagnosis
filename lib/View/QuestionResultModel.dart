import 'dart:core';

class QuestionResultModel {
  String titleText;
  String resultText;
  String flavorText;
  List<QuestionResultAnswerModel> answers;
  List<QuestionResultPastResultModel> history;

  QuestionResultModel(
      this.titleText,
      this.resultText,
      this.flavorText,
      this.answers,
      this.history,
      );
}

class QuestionResultAnswerModel {
  String question;
  String answer;

  QuestionResultAnswerModel(String question, String answer) {
   this.question = question;
   this.answer = answer;
  }
}

class QuestionResultPastResultModel {
  String date;
  String resultText;

  QuestionResultPastResultModel(this.date, this.resultText);
}