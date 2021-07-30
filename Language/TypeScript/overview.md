# TypeScriptの概要
Microsoft社が開発・保守しているプログラミング言語。厳密な型付けなどの追加機能をJavaScriptに導入したもの。


- [TypeScriptの概要](#typescriptの概要)
  - [なぜTypeScriptを使うのか？](#なぜtypescriptを使うのか)
  - [TypeScriptの特徴](#typescriptの特徴)
    - [型システム](#型システム)
  - [参考](#参考)

## なぜTypeScriptを使うのか？
JavaScriptの欠点である型変換問題では、JavaScriptのランタイム中にしか検出できず、バグの発見が遅れてしまう。  
しかしTypeScriptでは、コンパイル時に問題がないかどうかをチェックすることで、この問題を解消している。

TypeScriptはどのブラウザでも理解できないので、ブラウザがコードを実行できるようにJavaScriptに変換する必要がある。

## TypeScriptの特徴
### 型システム
- **Number**
  - 数値 倍精度の64ビット浮動小数点値。整数と分数の両方を表すことができる。
- **String**
  - 文字 Unicode 文字の並びを表す。
- **Boolean**
  - 論理値、true および false を表す。
- **void**
  - void 戻り値のない関数を表す。
- **Null**
  - null オブジェクトの値が存在しないことを表す。
- **Undefined**
  - undefined 初期化されていないすべての変数を表す。

## 参考
- [そろそろTypeScriptに入門するから、TypeScriptとは何なのか、どう良いのか書いておく \- Qiita](https://qiita.com/e99h2121/items/09892779dcb26a70bc97)