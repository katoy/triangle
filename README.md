USAGE
======

    $ git clone https://github.com/katoy/triangle
    $ cd triangle
    
    $ cake 
    
    $ cake setup clean compile
    
    $ cake spec

Description
============

This is a sample for using coffeescriot and jasmine-node.

これは coffeescript と jasmone-node の利用例です。

src/traiangke*.coffee として２つのクラスを実装し、
それを spec/*.coffee でテストします。

２つのクラスとも、
  3つの整数 ([-100 .. 100] の範囲) を指定すると、
  それを３辺の長さとした三角形の状態を判定する kind(a, b, c) メソッド
を実装しています。

[-100.. 100] の範囲の整数では、判定処理中で演算のオーバー・アンダーフローは
発生しません。
しかし、実装コード中では、途中の演算結果が [-100..100] を超えると exception　が
発生するようにしてあります。

src/triangle.coffee は処理中にオーバー・アンダーフローが発生しない工夫をしてあります。
src/triangle-bad.coffee は処理中にオーバー・アンダーフローが発生する可能性があります。

 jasmin-node でのテストでは、その状況をキャッチできるテストケースを書いてあります。

 クラス実装、テストケースの編集に伴う coffeescrit -> javascript の compile,
 テストの実施、
 npm での modules の設定
 などを cake で行えるようにもしてあります。
 
//--- End of File ---
