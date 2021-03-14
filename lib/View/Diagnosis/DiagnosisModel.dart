import 'package:depression_diagnosis/View/QuestionWidgetModel.dart';

class DiagnosisModel {
  List<QuestionWidgetModel> questions;
  String title;
  Function(List<int>) answerFinished = (List<int> answerResultIndices){};
}