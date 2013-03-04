
testling: [![browser support](http://ci.testling.com/katoy/triangle.png)](http://ci.testling.com/katoy/triangle)

travis: [![Build Status](https://travis-ci.org/katoy/triangle.png?branch=master)](https://travis-ci.org/katoy/triangle)

USAGE
======

    $ git clone https://github.com/katoy/triangle
    $ cd triangle
    
    $ npm install -g coffee-script
    $ npm install -g vows
    
    $ cake 
    
    $ cake setup

    $ cake clean
    $ cake compile
    $ cake inst
    
    $ cake spec

    $ cake test

    $ cake run
    then access http://localhost:3000

   (OPTION)  need pandoc ( See http://johnmacfarlane.net/pandoc/installing.html )
   $ cake make-docs

Description
============

This is a sample for using coffeescriot, (zombie and vows), quint, phantomjs, jsTestDriver

これは coffeescript と (zombie と vows),  qunit, phantomjs, jsTestDriver の利用例です。

src/triangle*.coffee として２つのクラスを実装し、
それを spec/*.coffee に記載したテストを (zombie と vows) で実行します。
また、src/triangle*.coffee をつかった web ページを作成し、
qunit, phantomjs, jsTestDriver でテストします。

２つのクラスとも、
  3つの整数 ([-100 .. 100] の範囲) を指定すると、
  それを３辺の長さとした三角形の状態を判定する kind(a, b, c) メソッド
を実装しています。

[-100.. 100] の範囲の整数では、判定処理中で演算のオーバーフローは
発生しません。
ここでの実装コード中では、オーバーフロー発生を知るために
途中の演算結果が [-100..100] を超えた場合 exception　が発生するようにしてあります。

src/triangle-bad.coffee は処理中にオーバーフローが発生する可能性が残っています。
src/triangle.coffee は処理中にオーバーフローが発生しない工夫をしてあります。

spec/*.coffee のテストでは、その状況をキャッチできるテストケースを書いてあります。

web アプリを server.coffee として作成してあります。
cake test では、 zombie をつかって web ブラウザ経由でテストをします。

cake test_phantomjs では phantomjs をブラウザ代わりに使ってテストをします。
cake test_jsTestriver では chrome, safarim firefox で一括にテストをします。

次の処理を cake で行えるようにもしてあります。
 * クラス実装、テストケースの編集に伴う coffeescript -> javascript の compile,
 * テストカバレッジ計測機能を *.js に組み込む。
 * npm での modules のインストール

 $ cake とコマンドラインで入力すれば、cake で指定出来るタスクが一覧表示されます。
 
//--- End of File ---
