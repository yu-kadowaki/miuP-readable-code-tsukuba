# リーダブルコード勉強会 in 筑波

## 仕様
- main.swift内のyourFilePathにファイルパスを指定する
- ファイルの各行にIntのidを振って、標準入力に与えられたidを持つStringを出力する
- 標準入力に何も与えなかった場合は全部のレシピを表示する
- 取得できない場合はerrorの文字列を返す

## 現時点(仕様9)での実行方法
1. コマンドライン上で以下を実行(main.swiftがあるディレクトリに移動する)
```
swift main.swift
```
2. 最初の入力は, レシピIDなので1, 2, 3のいずれか, または何も打たない. 入力したらEnter
3. 次の入力は, ユーザ名なので文字を入力する(バリデーションはかかっていない)
4. 2~3を4回繰り返す
※ 仕様間違えたので後でやり直します!泣
