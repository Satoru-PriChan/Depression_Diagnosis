import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class DiagnosisResultEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.diagnosisResult;
  final int diagnosisID;
  final String name;
  final String flavorText;

  DiagnosisResultEntity(this.name, this.diagnosisID, this.flavorText, [this._id = null]);

  factory DiagnosisResultEntity.fromMap(Map<String, dynamic> json) => DiagnosisResultEntity(
      json['name'],
      json['diagnosisID'],
      json['flavorText'],
      json['id'],
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      //idは指定しなければSQLiteが勝手に補完してくれるので指定しない
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