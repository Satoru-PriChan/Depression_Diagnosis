import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class DiagnosisEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.diagnosis;
  final String name;

  DiagnosisEntity(this.name, [this._id = null]);

  factory DiagnosisEntity.fromMap(Map<String, dynamic> json) => DiagnosisEntity(
      json['name'],
      json['id']
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      //idは指定しなければSQLiteが勝手に補完してくれるので指定しない
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