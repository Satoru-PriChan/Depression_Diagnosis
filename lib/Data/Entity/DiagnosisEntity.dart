import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class DiagnosisEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.diagnosis;
  final String name;

  DiagnosisEntity(this.name, this._id);

  factory DiagnosisEntity.fromMap(Map<String, dynamic> json) => DiagnosisEntity(
      json['name'],
      json['id']
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  int get id => _id;

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'DiagnosisEntity{id: $id, name: $name}';
  }
}