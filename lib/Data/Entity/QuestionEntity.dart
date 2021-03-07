import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class QuestionEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.question;
  final String imageName;
  final String question;
  final String answer01;
  final String answer02;
  final String answer03;
  final String answer04;
  final String answer05;
  final String answer06;
  final String answer07;
  final String answer08;
  final String answer09;
  final String answer10;
  final int diagnosisID;
  final int maxSelectionCount;

  QuestionEntity(
      this.imageName,
      this.question,
      this.answer01,
      this.answer02,
      this.answer03,
      this.answer04,
      this.answer05,
      this.answer06,
      this.answer07,
      this.answer08,
      this.answer09,
      this.answer10,
      this.diagnosisID,
      this.maxSelectionCount,
      this._id
      );

  factory QuestionEntity.fromMap(Map<String, dynamic> json) => QuestionEntity(
      json['imageName'],
      json['question'],
      json['answer01'],
      json['answer02'],
      json['answer03'],
      json['answer04'],
      json['answer05'],
      json['answer06'],
      json['answer07'],
      json['answer08'],
      json['answer09'],
      json['answer10'],
      json['maxSelectionCount'],
      json['diagnosisID'],
      json['id']
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageName': imageName,
      'question': question,
      'answer01': answer01,
      'answer02': answer02,
      'answer03': answer03,
      'answer04': answer04,
      'answer05': answer05,
      'answer06': answer06,
      'answer07': answer07,
      'answer08': answer08,
      'answer09': answer09,
      'answer10': answer10,
      'diagnosisID': diagnosisID,
      'maxSelectionCount': maxSelectionCount,
    };
  }

  @override
  int get id => _id;

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'QuestionEntity{'
        'id: $id, '
        'imageName: $imageName, '
        'question: $question,'
        'answers: $answer01, '
        '$answer02, '
        '$answer03, '
        '$answer04, '
        '$answer05, '
        '$answer06, '
        '$answer07, '
        '$answer08, '
        '$answer09, '
        '$answer10, '
        'diagnosisID: $diagnosisID, '
        ' maxSelectionCount: $maxSelectionCount}';
  }
}