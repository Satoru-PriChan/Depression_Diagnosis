import 'dart:io';
import 'package:depression_diagnosis/Data/Entity/DiagnosisEntity.dart';
import 'package:depression_diagnosis/Data/Entity/DiagnosisResultEntity.dart';
import 'package:depression_diagnosis/Data/Entity/DiagnosisResultHistoryEntity.dart';
import 'package:depression_diagnosis/Data/Entity/QuestionEntity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'DBEntityProtocol.dart';

// DBで取り扱いたいオブジェクトの種類
enum DBObjectsStrategy {
  question,
  diagnosis,
  diagnosisResult,
  diagnosisResultHistory,
}

// extensionを追加することで、enumに変数や関数を追加できる
extension DBObjectsStrategyExtension on DBObjectsStrategy {

  // 各オブジェクトに対応するテーブル名を定義
  String get tableName {
    switch (this) {
      case DBObjectsStrategy.question:
        return 'question';
      case DBObjectsStrategy.diagnosis:
        return 'diagnosis';
      case DBObjectsStrategy.diagnosisResult:
        return 'diagnosisResult';
      case DBObjectsStrategy.diagnosisResultHistory:
        return 'diagnosisResultHistory';
    }
  }

  // データベースから取り出したList<Map<String, dynamic>>型を各オブジェクトに変換
  List<DBEntityProtocol> getObject(List<Map<String, dynamic>> res) {
    switch (this) {
      case DBObjectsStrategy.question:
        List<QuestionEntity> list =
        res.isNotEmpty ? res.map((c) => QuestionEntity.fromMap(c)).toList() : [];
        return list;
      case DBObjectsStrategy.diagnosis:
        List<DiagnosisEntity> list =
        res.isNotEmpty ? res.map((c) => DiagnosisEntity.fromMap(c)).toList() : [];
        return list;
      case DBObjectsStrategy.diagnosisResult:
        List<DiagnosisResultEntity> list =
        res.isNotEmpty ? res.map((c) => DiagnosisResultEntity.fromMap(c)).toList() : [];
        return list;
      case DBObjectsStrategy.diagnosisResultHistory:
        List<DiagnosisResultHistoryEntity> list =
        res.isNotEmpty ? res.map((c) => DiagnosisResultHistoryEntity.fromMap(c)).toList() : [];
        return list;
    }
  }
}

class DBClient {
  static Database _database;

  static Future<String> databasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return path;
  }

  static Future<Database> get database async {
    if (_database != null)
      return _database;

    // DBがなかったら作る(初回のみ)
    _database = await initDB();
    return _database;
  }

  static Future<Database> initDB() async {
    String path = await databasePath();
    // DB作成時にテーブル作成も行う
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  // テーブルを作成する
  static Future<void> _createTable(Database db, int version) async {
    var createDiagnosisStr = "CREATE TABLE ${DBObjectsStrategy.diagnosis.tableName}("
        "id INTEGER PRIMARY KEY, "
        "name TEXT"
        ")";
    var createQuestionStr = "CREATE TABLE ${DBObjectsStrategy.question.tableName}("
          "id INTEGER PRIMARY KEY, "
          "imageName TEXT, "
          "age INTEGER, "
          "question TEXT, "
          "answer01 TEXT, "
          "answer02 TEXT, "
          "answer03 TEXT, "
          "answer04 TEXT, "
          "answer05 TEXT, "
          "answer06 TEXT, "
          "answer07 TEXT, "
          "answer08 TEXT, "
          "answer09 TEXT, "
          "answer10 TEXT, "
          "diagnosisID INTEGER, "
          "maxSelectionCount INTEGER, "
          "foreign key(diagnosisID) references ${DBObjectsStrategy.diagnosis.tableName}(id)"
          ")";
    var createDiagnosisResultStr = "CREATE TABLE ${DBObjectsStrategy.diagnosisResult.tableName}("
        "id INTEGER PRIMARY KEY, "
        "diagnosisID INTEGER, "
        "name TEXT, "
        "flavorText TEXT, "
        "foreign key(diagnosisID) references ${DBObjectsStrategy.diagnosis.tableName}(id)"
        ")";
    var createDiagnosisResultHistoryStr = "CREATE TABLE ${DBObjectsStrategy.diagnosisResultHistory.tableName}("
        "id INTEGER PRIMARY KEY, "
        "diagnosisResultID INTEGER, "
        "date TEXT, "
        "foreign key(diagnosisResultID) references ${DBObjectsStrategy.diagnosisResult.tableName}(id)"
        ")";

    print("creating diagnosis table: ${createDiagnosisStr}");
    await db.execute(createDiagnosisStr);
    await db.execute(createQuestionStr);
    await db.execute(createDiagnosisResultStr);
    await db.execute(createDiagnosisResultHistoryStr);

    //初期データ注入
    return await _populateDB(db);
  }

  /// テーブルに初期データ注入
  static Future<void> _populateDB(Database db) async {
    final List<DiagnosisEntity> diagnosisData = [
      DiagnosisEntity("うつ病診断", 1),
    ];
    final List<DiagnosisResultEntity> diagnosisResultData = [
      DiagnosisResultEntity("正常", 1, "全く問題ありません！ただし無理をし過ぎれば誰でも鬱になる可能性がありますので、日頃から心身をケアする時間は持つようにしておきましょう。", 1,),
      DiagnosisResultEntity("軽度", 1, "軽い鬱症状が見られます。生活を少し見直し、ストレス源となっている物を取り除いたり、バランスの取れた食事や軽い運動、日光浴などを心がけましょう。", 2,),
      DiagnosisResultEntity("中等度", 1, "うつ病である可能性が高いです。生活を整えるのに加えて、信頼できる心療内科等に相談しましょう。", 3,),
      DiagnosisResultEntity("重度", 1, "うつの症状が重くなっています。今日にでも心療内科や精神科を予約しましょう。お薬などでうつを和らげつつ、生活再建の時間を作っていけましょう。", 4,),
      DiagnosisResultEntity("きわめて重度", 1, "非常に深刻な状態です！ 今すぐ落ち着ける環境に身を置き、精神科の予約をとってください。症状が少し和らぐまでは、生き残ることだけを考えてください。", 5,),
    ];
    final List<QuestionEntity> questionData = [
      QuestionEntity(
          "assets/0001-depression-sleep-onset-insomnia.png",
          "寝付くのにどのくらい時間がかかりますか？",
          "ほとんどかからない（いつも30分以下）",
          "30分ほどかかる日が、一週間のうち半分以下程度ある",
          "30分ほどかかる日が、一週間のうち半数を超える",
          "60分ほどかかる日が、一週間のうち半数を超える", "", "", "", "", "", "", 1, 1, 1),
      QuestionEntity(
          "assets/0002-depression-mid-nocturnal-insomnia.png",
          "夜、寝ている間に目を覚ますことがどのくらいありますか？",
          "問題ない（夜間に目が覚めることはほとんどない）",
          "浅い眠りで、何回か短く目が覚める日もある",
          "毎晩一回は目が覚めるが、難なくまた眠ることができる",
          "毎晩一回は目が覚める。しかも、そのまま２０分以上眠れないことが週の半数はある", "", "", "", "", "", "", 1, 1, 2),
      QuestionEntity(
          "assets/0003-depression-early-morning-insomnia.png",
          "早く目が覚めすぎることはどの程度ありますか？",
          "ほとんどない（早くても、起きなければいけない時間の30分前程度）",
          "週の半分以上、起きなくてはいけない時間より30分以上早く目が覚める",
          "ほとんどいつも、起きなくてはいけない時間より1時間程度早く目が覚めるが、また寝直すことができる",
          "ほとんどいつも、起きなくてはいけない時間より1時間以上早く目が覚め、もう寝直すことができない", "", "", "", "", "", "", 1, 1, 3),
      QuestionEntity(
          "assets/0004-depression-hypersomnia.png",
          "眠り過ぎてしまうことがどの程度ありますか？",
          "ほとんどない（夜眠りすぎることはなく、日中居眠りしてしまうこともない）",
          "24時間のうち、眠っている時間は昼寝を含め10時間程度",
          "24時間のうち、眠っている時間は昼寝を含め12時間程度",
          "24時間のうち、眠っている時間は昼寝を含め12時間を超える", "", "", "", "", "", "", 1, 1, 4),
      QuestionEntity(
          "assets/0005-depression-sad-mood.png",
          "普段、悲しい気持ちになることがどの程度ありますか？",
          "ほとんどない",
          "半分以下の時間、悲しいと感じている",
          "半分を超える時間、悲しいと感じている",
          "ほとんどいつも、悲しいと感じている", "", "", "", "", "", "", 1, 1, 5),
      QuestionEntity(
          "assets/0006-depression-too-less-appetite.png",
          "最近、食欲が低下することはありますか？",
          "普段と変わらない",
          "普段より少し回数や量が少ない",
          "普段よりかなり回数や量が少ない",
          "まる一日ほとんど食べず、食べるのは極めて強く食べようと努力したり他人から勧められた場合のみだ", "", "", "", "", "", "", 1, 1, 6),
      QuestionEntity(
          "assets/0007-depression-too-much-appetite.png",
          "最近、食欲が増えていますか？",
          "普段と変わらない",
          "普段より頻繁または量が多いと感じることがある",
          "常に、普段より頻繁または量が多いと感じる",
          "食事の時も、食事の間も、食べ過ぎる衝動が強い", "", "", "", "", "", "", 1, 1, 7),
      QuestionEntity(
          "assets/0008-depression-weight-decrease.png",
          "体重減少について（最近2週間）",
          "体重は特に変わらない",
          "少し体重が減った",
          "１キログラム以上痩せた",
          "２キログラム以上痩せた", "", "", "", "", "", "", 1, 1, 8),
      QuestionEntity(
          "assets/0009-depression-weight-increase.png",
          "体重増加について（最近2週間）",
          "体重は特に変わらない",
          "少し体重が増えた",
          "１キログラム以上太った",
          "２キログラム以上太った", "", "", "", "", "", "", 1, 1, 9),
      QuestionEntity(
          "assets/0010-depression-concentration.png",
          "集中力・決断力に変化はありますか？",
          "集中力・決断力に普段と変化はない",
          "時々決断しづらくなっているように感じたり、注意が散漫になるように感じる",
          "ほとんどの時間、注意を集中したり、決断を下すのに苦労する",
          "ものを読むことも十分にできなかったり、小さなことですら決断できないほど集中力が落ちている", "", "", "", "", "", "", 1, 1, 10),
      QuestionEntity(
          "assets/0011-depression-guilt.png",
          "自分のことをどう思いますか？",
          "自分のことを、他の人と同じくらい価値があって、援助に値する人間だと思う",
          "少し自分のことを責めがちだ",
          "自分が他の人に迷惑をかけているとかなり信じている",
          "自分の欠点について、ほとんど常に考えている", "", "", "", "", "", "", 1, 1, 11),
      QuestionEntity(
          "assets/0012-depression-suicidal-ideation.png",
          "死や自殺について考えることはありますか？",
          "死や自殺について考えることはない",
          "人生が空っぽに感じ、生きている価値があるかどうか疑問に思う",
          "自殺や死について、一週間に数回、数分間にわたって考えることがある",
          "自殺や死について1日に何回か細部にわたって考える、または具体的な自殺の計画を立てたり、実際に死のうとしたりしたことがあった", "", "", "", "", "", "", 1, 1, 12),
      QuestionEntity(
          "assets/0013-depression-involvement.png",
          "興味について",
          "他人のことやいろいろな活動についての興味は普段と変わらない",
          "他人や活動について、普段より興味が薄れていると感じる",
          "以前好んでいた活動のうち、一つか二つのことにしか興味がなくなっていると感じる",
          "以前好んでいた活動に、ほとんど全く興味がなくなっている", "", "", "", "", "", "", 1, 1, 13),
      QuestionEntity(
          "assets/0014-depression-fatigue.png",
          "エネルギーのレベル",
          "普段のエネルギーのレベルと変わりない",
          "普段よりも疲れやすい",
          "普段の日常の活動（例えば買い物、宿題、料理、出勤など）をやり始めたり、やり遂げるのに大きな努力が必要だ",
          "ただエネルギーがないというだけで、日常の活動のほとんどが実行できない", "", "", "", "", "", "", 1, 1, 14),
      QuestionEntity(
          "assets/0015-depression-psycomotor-slowing.png",
          "動きや思考が遅くなったと感じることはありますか？",
          "普段通りの速さで考えたり、話したり、動いたりしている",
          "頭の動きが遅くなっていたり、声が単調で平坦に感じる",
          "ほとんどの質問に答えるのに何秒かかかり、考えが遅くなっているのがわかる",
          "最大の努力をしないと、質問に答えられないことがしばしばある", "", "", "", "", "", "", 1, 1, 15),
      QuestionEntity(
          "assets/0016-depression-psycomotor-slowing.png",
          "なんとなく落ち着かないことはありますか？",
          "落ち着かない気持ちはない",
          "しばしばそわそわして、手を揉んだり、座り直したりせずにはいられない",
          "動き回りたい衝動があって、かなり落ち着かない",
          "時々、座っていられなくて歩き回らずにはいられないことがある", "", "", "", "", "", "", 1, 1, 16),
    ];

    diagnosisData.forEach((element) async {
      await db.insert(element.strategy.tableName, element.toMap());
    });
    diagnosisResultData.forEach((element) async {
      await db.insert(element.strategy.tableName, element.toMap());
    });
    questionData.forEach((element) async {
      await db.insert(element.strategy.tableName, element.toMap());
    });
  }

  static add(DBEntityProtocol obj) async {
    final db = await database;
    var res = await db.insert(obj.strategy.tableName, obj.toMap());
    return res;
  }

  ///      where: 'columnId = ?',
  ///      whereArgs: [id]
  static query(DBObjectsStrategy strategy, {String where = null, List<dynamic> whereArgs = null}) async {
    final db = await database;
    var res = await db.query(
        strategy.tableName,
      where: where,
      whereArgs: whereArgs,
    );
    List<dynamic> list = strategy.getObject(res);
    return list;
  }

  static update(DBEntityProtocol obj) async {
    final db = await database;
    var res = db.update(
        obj.strategy.tableName,
        obj.toMap(),
        where: "id = ?",
        whereArgs: [obj.id]
    );
    return res;
  }

  static delete(int id, DBObjectsStrategy strategy) async {
    final db = await database;
    var res = db.delete(
        strategy.tableName,
        where: "id = ?",
        whereArgs: [id]
    );
  }

  /// データベース初期化（全削除）
  static Future<void> resetDatabase() async {
    String path = await databasePath();
    if (path != null) {
     await deleteDatabase(path);
    }

  }
}