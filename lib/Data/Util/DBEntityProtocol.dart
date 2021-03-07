import 'DBClient.dart';

/// データベースで取り扱いたいオブジェクトが備えておかなければならない要素をプロトコルとして定義
abstract class DBEntityProtocol {

  int get id;
  DBObjectsStrategy get strategy;

  // Abstract method.
  Map<String, dynamic> toMap();
}