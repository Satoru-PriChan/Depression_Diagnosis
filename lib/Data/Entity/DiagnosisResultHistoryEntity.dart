import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/Data/Util/DBEntityProtocol.dart';

class DiagnosisResultHistoryEntity implements DBEntityProtocol {
  final int _id;
  final DBObjectsStrategy strategy = DBObjectsStrategy.diagnosisResultHistory;
  final int diagnosisResultID;
  final String date;

  DiagnosisResultHistoryEntity(this.diagnosisResultID, this.date, [this._id = null]);

  factory DiagnosisResultHistoryEntity.fromMap(Map<String, dynamic> json) => DiagnosisResultHistoryEntity(
      json['diagnosisResultID'],
      json['date'],
      json['id'],
  );

  @override
  Map<String, dynamic> toMap() {
    return {
      //idは指定しなければSQLiteが勝手に補完してくれるので指定しない
      'diagnosisResultID': diagnosisResultID,
      'date': date,
    };
  }

  @override
  int get id => _id;

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'DiagnosisResultHisotryEntity{id: $id, diagnosisResultID: $diagnosisResultID, date: $date}';
  }
}