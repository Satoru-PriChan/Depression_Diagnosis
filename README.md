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

SizedBox, ConstrainedBox

https://itome.team/blog/2019/12/flutter-advent-calendar-day9/ FlutterのBoxConstraintsを理解する
https://nzigen.com/flutter-reference/2018-05-01-constrained-box.html 要素の大きさを制限する