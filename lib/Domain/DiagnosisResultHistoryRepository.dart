import 'package:depression_diagnosis/Data/Entity/DiagnosisResultEntity.dart';
import 'package:depression_diagnosis/Data/Entity/DiagnosisResultHistoryEntity.dart';
import 'package:depression_diagnosis/Data/Util/DBClient.dart';
import 'package:depression_diagnosis/View/DiagnosisResultModel.dart';
import 'package:intl/intl.dart';

abstract class DiagnosisResultHistoryRepositoryProtocol {
  Future<List<DiagnosisResultPastResultModel>> fetch(int diagnosisID){}
  Future<void> add(int diagnosisResultID) {}
}

class DiagnosisResultHistoryRepository implements DiagnosisResultHistoryRepositoryProtocol {

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Future<List<DiagnosisResultPastResultModel>> fetch(int diagnosisID) async  {

    // DBより特定のdiagnosisIDに紐づくresultEntity を取得
   List<DiagnosisResultEntity> resultEntities = await DBClient.query(
       DBObjectsStrategy.diagnosisResult,
        where: 'diagnosisID = ?',
        whereArgs: [diagnosisID],
   );
   print("🇺🇸queried resultEntites: $resultEntities");

   // resultの名前、及びhistoryの日付を組み合わせmodelを作成
   List<DiagnosisResultPastResultModel> models = [];
   await Future.forEach(resultEntities, (element) async {
     List<DiagnosisResultHistoryEntity> fetchedHistoryEntities = await DBClient.query(
         DBObjectsStrategy.diagnosisResultHistory,
         where: 'diagnosisResultID = ?',
         whereArgs: [element.id],
     );

     print("🇺🇸　fetched result history entities: $fetchedHistoryEntities");

     fetchedHistoryEntities.forEach((innerElement) {
       DiagnosisResultPastResultModel model = DiagnosisResultPastResultModel(
         innerElement.date,
         element.name
       );

       print("🇺🇸　created model: $model");

       models.add(model);
     });
   });

   print("🇺🇸 models before sort: $models");
   //時刻昇順にソート
   models.sort((a,b) => b.date.compareTo(a.date));
   print("🇺🇸 models after sort: $models");

  return models;
  }

  @override
  Future<void> add(int diagnosisResultID) async {
    //現在時刻
    var now = DateTime.now();
    final timeStr = formatter.format(now);

    //DBに追加
    await DBClient.add(
        DiagnosisResultHistoryEntity(
            diagnosisResultID,
            timeStr,
        )
    );
  }
}