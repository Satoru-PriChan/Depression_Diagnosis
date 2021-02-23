class QuestionWidgetModel {
  String imageName;
  String question;
  List<String> answers;
  int maxSelectionCount = 1;
  Function(int) selectionFinished = (int index){};
}