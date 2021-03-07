import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class DiagnosisResultEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.diagnosisResult;
  final int diagnosisID;
  final String name;
  final String flavorText;

  DiagnosisResultEntity(this.name, this.diagnosisID, this._id, this.flavorText);

  factory DiagnosisResultEntity.fromMap(Map<String, dynamic> json) => DiagnosisResultEntity(
      json['name'],
      json['diagnosisID'],
      json['id'],
      json['flavorText'],
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'diagnosisID': diagnosisID,
      'name': name,
      'flavorText': flavorText,
    };
  }

  @override
  int get id => _id;

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'DiagnosisResultEntity{id: $id, , diagnosisID: $diagnosisID, name: $name, flavorText: $flavorText}';
  }
}