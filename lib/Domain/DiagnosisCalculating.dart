import 'package:depression_diagnosis/Data/Entity/DiagnosisResultEntity.dart';
import 'package:depression_diagnosis/Data/Util/DBClient.dart';

/// 診断の答えを計算する
abstract class DiagnosisCalculating {
  CalculatedDiagnosisResult calculate(List<List<int>> answerIndicesList, List<List<String>> answerStringsList){}
}

/// 診断の答え
class CalculatedDiagnosisResult {
  String resultTxt;
  String flavorTxt;
  int diagnosisResultID;

  CalculatedDiagnosisResult(this.resultTxt, this.flavorTxt, this.diagnosisResultID);
}

/// うつ病診断の答えを計算する
class DepressionDiagnosisCalculator implements DiagnosisCalculating {
  @override
  CalculatedDiagnosisResult calculate(List<List<int>> answerIndicesList, List<List<String>> answerStringsList) {

    int score = 0;
    answerIndicesList.forEach((answerIndices) {
       score += (answerIndices[0]);
    });

    List<DiagnosisResultEntity> results = DBClient.query(DBObjectsStrategy.diagnosisResult);
    DiagnosisResultEntity result;

    if (score <= 5) {
      result = results[0];
     } else if (6 <= score && score <= 10) {
      result = results[1];
    } else if (11 <= score && score <= 15) {
      result = results[2];
    } else if (16 <= score && score <= 20) {
      result = results[3];
    } else {
      result = results[4];
    }

    CalculatedDiagnosisResult calculatedDiagnosisResult = CalculatedDiagnosisResult(
        result.name,
        result.flavorText,
        result.id,
    );
    return calculatedDiagnosisResult;
  }
}
