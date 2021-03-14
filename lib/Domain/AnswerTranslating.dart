import 'package:depression_diagnosis/View/DiagnosisResultModel.dart';

/// DiagnosisResultAnswerModelを作成する
abstract class AnswerTranslating {
  List<DiagnosisResultAnswerModel> translate(List<String> questions, List<List<String>> answerStringsList) {}
}

class AnswerTranslator implements AnswerTranslating {
  @override
  List<DiagnosisResultAnswerModel> translate(List<String> questions, List<List<String>> answerStringsList) {
    List<DiagnosisResultAnswerModel> models = [];

    for (var i = 0; i < questions.length; i++) {

      String answer = "<無回答>";

      if (i < answerStringsList.length && answerStringsList[i].isNotEmpty) {
        List<String> answerStrings = answerStringsList[i];
        answer = answerStrings.reduce((value, element) => value + ", " + element);
      }

      DiagnosisResultAnswerModel model = DiagnosisResultAnswerModel(questions[i], answer);
      models.add(model);
    }

    return models;
  }
}