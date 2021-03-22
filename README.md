# depression_diagnosis

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Flutter 基本

[Flutter入門 - 簡単なアプリを作ってUI宣言やホットリロードなど便利機能の使い方を理解しよう
](https://eh-career.com/engineerhub/entry/2019/08/06/103000)
[Flutter でモバイルアプリを作ってみる 入門編① 〜ヘッダーとフッター〜
](https://www.apps-gcp.com/introduction-of-flutter-about-header-and-footer/)

export PATH="$PATH:/Users/a999-503/development/flutter/bin"

インストール後、flutter doctorでさらに環境をととのえる
https://flutter.dev/docs/get-started/install/macos#run-flutter-doctor
https://qiita.com/mkosuke/items/7957e71968aefc6558be

Android studio のflutter extension とdirt extensionが必要だった。

エラー
Flutter plugin not installed this adds Flutter specific functionality Dart plugin not installed this adds Dart specific functionality

-> [stack over flow](https://stackoverflow.com/questions/51860845/flutter-plugin-not-installed-error-when-running-flutter-doctor)
ln -s ~/Library/Application\ Support/Google/AndroidStudio4.1/plugins ~/Library/Application\ Support/AndroidStudio4.1
↑を叩くとうまくいった。単に、flutter doctorが探す場所が分かるようにシンボリックリンクを追加しただけである。

[Flutter入門 - 簡単なアプリを作ってUI宣言やホットリロードなど便利機能の使い方を理解しよう
](https://eh-career.com/engineerhub/entry/2019/08/06/103000)

サンプル・アプリはここまでにして、より実践的なアプリを作りましょう。
世の中の多くのアプリにある「HTTP通信を行う」「リストビューによって多数の項目を表示する」といった機能を実装します。本記事ではGitHubのFlutterリポジトリにあるIssuesを一覧表示するアプリを作っていきます。

外部ライブラリ追加

http request用ライブラリ
https://pub.dev/packages/http

## Android Studio ショートかっと

Command + Shift + f 検索
https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja

## シングルトン

https://sbfl.net/blog/2015/01/04/implementing-factory-and-singleton-pattern-in-dart/



class MyStore {
  static final Map<String, dynamic> _items = <String, dynamic>{};
  static final MyStore _cache = MyStore._internal();

  MyStore._internal();

  factory MyStore() {
    return _cache;
  }

  set(String key, dynamic data) => _items[key] = data;
  get(String key) => _items[key];
}

## if文、for文


https://www.cresc.co.jp/tech/java/Google_Dart2/language/control_flow/control_flow.html

## Futures, async, await

https://dart.dev/codelabs/async-await

## Dynamic 


動的型付け
https://note.com/hatchoutschool/n/n767701b099b0

APIやSQLiteからデータを取得するときよく使う。

## Android Studio のショートカットキー

https://medium.com/mindorks/11-android-studio-shortcuts-every-android-developer-must-know-a153e736e611

Shift ２連打 -> プロジェクト全体の検索

Ctrl + E -> 最近開いたファイル

Command + shift + A -> 全ショートカットキー一覧

## Underscore

https://stackoverflow.com/questions/53142171/what-does-underscore-before-variable-name-mean-for-flutter

_のついた変数、クラス、メソッドは、それが宣言されたdartファイル内でのみアクセスできる。

クラス名._();　とやれば、コンストラクタがプライベートとなり、そのクラスは外から初期化できなくなる。

https://www.366service.com/jp/qa/530a2dae7c68f1f136dec8cbe4350bd7

## Codable 的なもの

Json <-> map, list

https://dart.dev/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more

Map, list <-> class object

ない

https://stackoverflow.com/questions/54949087/how-to-convert-class-object-to-data-structure-map-or-a-list-of-maps-in-dart

## 定数のリスト

クラスなどの中でStatic const

またはトップレベルでconst 

https://stackoverflow.com/questions/54069239/whats-the-best-practice-to-keep-all-the-constants-in-flutter

const String TABLE_NAME_CAT = 'cat’;　　　など

Constはコンパイル時に値が必要な定数で、finalは必要ない定数（動作時に一回だけ値を入れられる）
こうした用途で使うならconstがいいだろう。

## 文字列へ変数を埋め込み

https://sites.google.com/site/dartmedart/string-kurasuni-guansurumemo

String embed = "Moco";
print("${embed}'s kitchen"); // ${変数名}
print("$embed's kitchen"); // {} は省略可

## Generics 的なもの

https://dart.academy/generics-in-dart-and-flutter/ 

Dynamic

https://dart.dev/guides/language/language-tour#using-generic-methods

普通に<T>とかやってクラスやメソッドに指定するもの

## Protocol 的なもの

Abstract class

https://dart.dev/guides/language/language-tour#abstract-classes

https://stackoverflow.com/questions/52854383/flutter-protocols-do-they-exist

https://medium.com/dev-genius/flutter-protocol-oriented-programming-c27082af9bfc


Abstract getterって？

https://github.com/dart-lang/sdk/issues/28555

String get tableNameなどとするとget-onlyの扱いにできる。

implement時は

@override
// TODO: implement tableName
String get tableName => TABLE_NAME_CAT;

のように書く。

Implements と extends の違い？？

Static はabstract classに書けないようだ・・・
なので、クラスの名前をテーブルの名前として使うしかないかもしれない。

## Class などのタイプそれ自体

https://api.dart.dev/stable/2.10.4/dart-core/Type-class.html

## DB

Flutterでのデータ永続化 https://flutter.dev/docs/cookbook/persistence

DB: 

[【Flutter】sqfliteでローカルDBを実装する](https://qiita.com/umechanhika/items/47429c4d37ac733385ab)
[FlutterでローカルDBを扱う方法](https://iganin.hatenablog.com/entry/2019/01/09/010804)
[Persist data with SQLite](https://flutter.dev/docs/cookbook/persistence/sqlite)

Swiftではラッパーを以下のように作っていたので、dartでも以下のように便利なやつを作りたい。

import Foundation
import RealmSwift
import RxSwift

final class RealmUtil {

    /// query:　検索
    /// - Parameters:
    ///  - type: Objectのtype
    ///  - predicate: 検索するNSPredicate, 全取得の場合はnilを設定
    ///  - sortedKey: ソート KeyPath
    ///  - ascending: bool
    ///  - limit: 取得数, 全取得の場合は0以下を指定
    /// - Returns:
    ///     Observable<G>　（検索結果は一件ずつ）
    static func query<G: RealmObject>(type: G.Type, predicate: NSPredicate?, sortedKey: String = "", ascending: Bool = true, limit: Int = 0) -> Observable<G> {
        Observable.create { observer in
            do {
                let realm = try Realm()

                var objects: Results<G>
                if let predicate = predicate {
                    objects = realm.objects(type).filter(predicate)
                } else {
                    objects = realm.objects(type)
                }

                let items = Array(sortedKey.isEmpty ? objects :
                    objects.sorted(byKeyPath: sortedKey, ascending: ascending))

                if items.isEmpty != true {
                    let limitCount = (limit < 1 || limit > items.count) ? items.count : limit
                    for i in 0 ..< limitCount {
                        observer.onNext(items[i])
                    }
                }
                observer.onCompleted()
            } catch {
                Logger.debug("RealmUtil.query() error:\(error)")
                observer.onError(AppError.noData)
            }
            return Disposables.create()
        }
    }

    /// add: 新規追加 or 更新
    /// - Parameters:
    ///  - object: 追加または更新するRealmObject
    ///  - updatePolicy: What to do if an object with the same primary key alredy exists. Must be `.error` for objects without a primary key.
    /// - Returns:
    ///     Observable<Void>
    static func add<G: RealmObject>(object: G, updatePolicy: Realm.UpdatePolicy = .modified) -> Observable<Void> {
        Observable.create { observer in
            do {
                let realm = try Realm()
                try realm.safeWrite {
                    realm.add(object, update: .modified)
                    observer.onNext(Void())
                    observer.onCompleted()
                }
            } catch {
                Logger.debug("RealmUtil.add() error:\(error)")
                observer.onError(AppError.generic)
            }
            return Disposables.create()
        }
    }

    /// delete: 削除
    /// - Parameters:
    ///  - objects: 削除するRealmObject Sequence
    /// - Returns:
    ///     Observable<Void>
    static func delete<G: RealmObject>(objects: [G]) -> Observable<Void> {
        Observable.create { observer in
            do {
                let realm = try Realm()

                try realm.safeWrite {
                    realm.delete(objects)
                    observer.onNext(Void())
                    observer.onCompleted()
                }
            } catch {
                Logger.debug("RealmUtil.delete() error:\(error)")
                observer.onError(AppError.generic)
            }
            return Disposables.create()
        }
    }

    /// delete object data: 特定のRealm Objectを削除
    /// - Parameters:
    ///  - objects: 削除するRealmObjectのtype
    ///  - predicate: 絞り込み条件。全削除の場合はnilを指定
    /// - Returns:
    ///     Observable<Void>
    static func deleteObjectData<G: RealmObject>(type: G.Type, predicate: NSPredicate? = nil)  -> Observable<Void> {
        Observable.create { observer in
            do {
                let realm = try Realm()

                try realm.safeWrite {
                    var objects: Results<G>
                    if let predicate = predicate {
                        objects = realm.objects(type).filter(predicate)
                    } else {
                        objects = realm.objects(type)
                    }

                    realm.delete(objects)
                    observer.onNext(Void())
                    observer.onCompleted()
                }
            } catch {
                Logger.debug("RealmUtil.deleteObjectData() error:\(error)")
                observer.onError(AppError.generic)
            }
            return Disposables.create()
        }
    }
}

extension RealmUtil {
    static func setRealmConfigration() {
        var config = Realm.Configuration()
        config.schemaVersion = RealmConfig.schemaVersion
        Realm.Configuration.defaultConfiguration = config
    }
}


 
 */


FlutterでのDBClient例 ただしプロトコルは使っていない

https://qiita.com/popy1017/items/7ada79b07281f4a8e544

Generics として指定したクラスそれ自体を中で使うには・・・genericメソッドではなくgenericクラスでないとダメかもしれない。

https://qiita.com/dracrowa6539/items/6534740b3a917f8fbb0d

https://camellabs.com/flutter-sqlite-crud-example-form/


## Enum 

https://stackoverflow.com/questions/38908285/add-methods-or-values-to-enum-in-dart

## そのほかのtips

https://logmi.jp/tech/articles/303939

## 画面遷移

[Flutter]画面遷移のやり方　　https://qiita.com/kono-hiroki/items/b1a8f19dfab371e7816d
公式 https://flutter.dev/docs/cookbook/navigation/navigation-basics

## 画像素材

イラストレイン　http://illustrain.com

## うつ病診断

  curl -v -H "x-rapidapi-host: onlinecounselling-online-counselling-v1.p.rapidapi.com" -H "x-rapidapi-key: db95ac19b8mshab0ad98f2d9c12dp19fd80jsnbb2707773797" https://onlinecounselling-online-counselling-v1.p.rapidapi.com/docs-anxiety-treatment

http://api.e-stat.go.jp/rest/3.0/app/json/getStatsData?appId=&lang=J&statsDataId=0003202042&metaGetFlg=Y&cntGetFlg=N&explanationGetFlg=Y&annotationGetFlg=Y&sectionHeaderFlg=1



うつ病チェック　https://utsu.ne.jp/self_check/

簡易よく鬱症状尺度 https://www.mhlw.go.jp/bunya/shougaihoken/kokoro/dl/02.pdf https://www.mdcalc.com/quick-inventory-depressive-symptomatology-qids

## エラー　Target of URI doesn't exist: 'package:flutter/material.dart'.


プロジェクトフォルダでflutter pub getを叩く　https://stackoverflow.com/questions/44909653/visual-studio-code-target-of-uri-doesnt-exist-packageflutter-material-dart

## => とは

https://stackoverflow.com/questions/51868395/flutter-dart-difference-between-and

The fat arrow syntax is simply a short hand for returning an expression and is similar to (){ return expression; }.

## エラー The following assertion was thrown resolving an image codec Unable to load asset

画像の名前は、pubspec.ymlに記載したものを正確に記載する必要がある。

## エラー　Vertical viewport was given unbounded height

https://stackoverflow.com/questions/50252569/vertical-viewport-was-given-unbounded-height

shrinkWrap: true を追加し、ListViewの高さがその中身のWidgetの高さによって決定されるようにした。

## 端末サイズ取得

https://note.com/hatchoutschool/n/n223ba8f1f3d7
final double deviceHeight = MediaQuery.of(context).size.height;

## デバッグ

コンソールログ出力
print(“hello world”);

ブレークポイント
ブレークポイントの設置後、debugボタン（runボタンの隣）を押す。

UI階層構造
Open Flutter DevToolsボタンを開くとブラウザが開き、Widgetの階層構造がチェックできる
https://flutter.dev/docs/development/tools/devtools/inspector

## UIの基本


公式解説　https://flutter.dev/docs/cookbook/design/drawer

Creating Reusable Custom Widgets in Flutter https://www.raywenderlich.com/10126984-creating-reusable-custom-widgets-in-flutter

-> 使い回しにはWidgetを使う
Stateful widget は自分で自分自身の外見を変える　Stateless Widgetは自分では変えない。どちらもbuildメソッドにより外見を定義して返す。

Glidview https://flutter.dev/docs/cookbook/design/orientation

質問の答えなので上からしたに並んでるだけの方が良さそう。


Create a horizontal list https://flutter.dev/docs/cookbook/lists/horizontal-list
Flutter: Displaying Dynamic Contents using ListView.builder 
https://medium.com/@DakshHub/flutter-displaying-dynamic-contents-using-listview-builder-f2cedb1a19fb

Item Selection in List View on Tap in flutter using ListView.Builder https://medium.com/@gadepalliaditya1998/item-selection-in-list-view-on-tap-in-flutter-using-listview-builder-612f6608505a

Selectable List View In Flutter https://vermahitesh.medium.com/select-list-items-in-flutter-21f58765c19b

## 要素の大きさを決定・制限する


Understanding constraints
https://flutter.dev/docs/development/ui/layout/constraints

SizedBox, ConstrainedBox

https://itome.team/blog/2019/12/flutter-advent-calendar-day9/ FlutterのBoxConstraintsを理解する
https://nzigen.com/flutter-reference/2018-05-01-constrained-box.html 要素の大きさを制限する

## iOSの設定

https://flutter.dev/docs/deployment/ios

iosフォルダにあるRunner.xcworkspaceをXCodeで開いて設定を編集する。バージョンとDeployment Targetをいじった場合は、Flutter側の設定ファイルも更新

# cp Users/development/flutter/bin/cache/artifacts/engine/ios/Flutter.podspec: No such file or directory

https://github.com/flutter/flutter/issues/55095

プロジェクトフォルダでflutter precacheを実行

# Error: Error when reading 'lib/main.dart': No such file or directory package main.dart: Error: No 'main' method found. Try adding a method named 'main' to your program.

main.dartファイルがlib直下になかったのでlib直下に移動

# A RenderFlex overflowed by 134 pixels on the bottom.
ウィジェットがデカすぎて画面をはみ出す、よくあるケース。単純にはみ出している全体をListViewで囲えばいい。

https://stackoverflow.com/questions/49480051/flutter-dart-exceptions-caused-by-rendering-a-renderflex-overflowed
全体をSingleChildScrollViewで囲うことも考えられる。
https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html

## test
Unit Test, Widget Test, Integration Testがある。
https://flutter.dev/docs/testing
https://flutter.dev/docs/testing/integration-tests
https://flutter.dev/docs/cookbook/testing/integration/introduction

## Automatically assigning platform `iOS` with version `12.1` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile.

platform :ios, '12.0'などをios/podfileで指定する

## Cocoapods: LoadError - dlsym(0x7fc10fbfc9c0, Init_ffi_c): symbol not found

Big Surで起きる。arch -x86_64 sudo gem install ffiを叩く。
https://github.com/flutter/flutter/wiki/Developing-with-Flutter-on-Apple-Silicon

## Unhandled Exception: type 'Future<dynamic>' is not a subtype of type 
awaitをつけてなかった

## [VERBOSE-2:profiler_metrics_ios.mm(184)] Error retrieving thread information: (ipc/send) invalid destination port

ios　シミュレータを再起動
https://github.com/flutter/flutter/issues/63025

## flutter: ignore recovered database ROLLBACK error DatabaseException(Error Domain=FMDatabase Code=1 "cannot rollback - no transaction is active" UserInfo={NSLocalizedDescription=cannot rollback - no transaction is active}) sql 'ROLLBACK' args []}

openDatabase　関数が終わる前（databaseの生成が終わる前）に、改めてそのdatabaseにアクセスして初期データをinsertしようとしてしまっていた。その代わり、openDatabaseのonCreateクロージャの引数として渡されるdatabaseを用いて、insertをすると上手くいった。

## The default value of an optional parameter must be constant.
デフォルト値を定数にしろ
関数内でデフォルト値を与えるのもあり
```
void f([int value]) {
  value ??= defaultValue;
}
```
https://dart.dev/tools/diagnostic-messages#non_constant_default_value

## flutter アプリの公式の例
https://flutter.github.io/samples/#

## widgetのライフサイクル

initState()はviewDidLoadやonCreateに相当する。

https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7
https://qiita.com/sekitaka_1214/items/b087f9e9fc13424a64bb

## map 関数

https://stackoverflow.com/questions/49941361/dart-mapping-a-list-list-map

## 明らかにコーディングはおかしくないのに意味不明なエラーがいっぱい出る

Android Studioの再起動、PC再起動
https://android-java.hatenablog.jp/entry/2016/10/01/080806

## 集計したい時
reduce関数

## 日付関係

DateTime
    toString()
        toString()で取得したstringはparseで元に戻すことができる。
    parse()
https://api.dart.dev/stable/2.12.1/dart-core/DateTime-class.html

DateFormatter
使い方
https://stackoverflow.com/questions/58337796/how-to-remove-time-from-date-flutter

## Undefined class 'DateFormat'

intlパッケージをpub getし、目的のファイルでimportする。
https://pub.dev/packages/intl/install

## DB insert idについて

DARTには関係ないが、SQLiteでカラムに対して INTEGER PRIMARY KEY を設定した場合、データを追加した時に INTEGER PRIMARY KEY を設定したカラムの値を指定しないと自動的に値が格納される。ので、そのカラムに特に値は指定せずinsertすればいい。
https://www.dbonline.jp/sqlite/table/index9.html

## 日付でソート

```
products.sort((a,b) {
    return a.compareTo(b);
 });
```
https://stackoverflow.com/questions/57000166/how-to-sort-order-a-list-by-date-in-dart-flutter

## ForEachで複数の非同期処理を行い、全て終わってから下の処理に進みたい

```
  Future.forEach(list, (num) async {
    // do something
  });
```
https://qiita.com/hisw/items/2df0052a400263d5863e

## .initState() returned a Future. State.initState() must be a void method without an `async` keyword. Rather than awaiting on asynchronous work directly inside of initState, call a separate method to do this work without awaiting it.

ウィジェット表示前に非同期処理をしたい場合、initState()メソッドをasyncにするのではなくFutureBuilderを使う。

```
Instead, you need to have your widget build normally and then have a way to notify your widget to update when the Future has returned. This is most easily done with a FutureBuilder:

@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: doSomeAsyncStuff(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        // Future hasn't finished yet, return a placeholder
        return Text('Loading');
      }
      return Text('Loading Complete: ${snapshot.data}');
    }
  );
}
```

https://stackoverflow.com/questions/61764400/state-initstate-must-be-a-void-method-without-an-async-keyword

## ListTile widgets require a Material widget ancestor.

Scafold, Materialで囲う。
https://stackoverflow.com/questions/51772910/no-material-widget-found-textfield-widgets-require-a-material-widget-ancestor/51773529

## デフォルト実装を提供するには

extends, またはmixinを使う。
https://stackoverflow.com/questions/17789399/providing-default-implementation-for-method-in-abstract-class

## 複数のウィジェットの横幅を同じサイズとしたい

それらのウィジェットをExpandedの中に入れ、それらをRowの中に入れる。
https://stackoverflow.com/questions/52583856/make-buttons-in-a-row-have-the-same-width-in-flutter

## アプリアイコン

https://qiita.com/rkowase/items/e0f3f8aec207ed8567aa
https://pub.dev/packages/flutter_launcher_icons
flutter_launcher_iconsを使う。

iphone実機で見た時アイコンが反映されていない箇所があるように思ったが、iphoneを再起動したら治った。おそらくspringboardのバグ。

## Android アダプティブアイコン

説明 https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive
ジェネレータ https://easyappicon.com

## Android キーストア

https://flutter.dev/docs/deployment/android#create-a-keystore

## This operation couldnt be completed. Unable to locate a Java Runtime. [macOS]

Java Runtime
https://code2care.org/howto/this-operation-couldnt-be-completed-unable-to-locate-a-java-runtime-maos

## android studio cannot resolve symbol 'GradleException'

FileNotFoundException()をGradleException()の代わりに使う。
https://stackoverflow.com/questions/55575122/android-studio-cannot-resolve-symbol-gradleexception
