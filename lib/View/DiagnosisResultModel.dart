import 'dart:core';

class DiagnosisResultModel {
  String titleText;
  String resultText;
  String flavorText;
  List<DiagnosisResultAnswerModel> answers;
  List<DiagnosisResultPastResultModel> history;

  DiagnosisResultModel(
      this.titleText,
      this.resultText,
      this.flavorText,
      this.answers,
      this.history,
      );
}

class DiagnosisResultAnswerModel {
  String question;
  String answer;

  DiagnosisResultAnswerModel(String question, String answer) {
   this.question = question;
   this.answer = answer;
  }
}

class DiagnosisResultPastResultModel {
  String date;
  String resultText;

  DiagnosisResultPastResultModel(this.date, this.resultText);

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'DiagnosisResultPastResultModel{'
        'date: $date, '
        'resultText: $resultText'
        '}';
  }
}