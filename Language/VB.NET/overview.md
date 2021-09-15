# VB.NET
Microsftが開発したオブジェクト指向型のプログラミング言語。  
自然言語に近い文法規則のため、学習コストが低い。

## 特徴
- 自然言語に近い文法規則のため、学習コストが低い
- Windows系のOSで動作するさまざまなシステムの開発が可能

## .NET Framework
マイクロソフトが開発した、WebサービスやWindowsのアプリケーションの開発や実行環境で利用される。

### CLR（共通言語ランタイム）とは
.NET Frameworkに搭載されている動作環境のこと。  
プログラムコードを.NET Framework上に入力すると、入力された言語がCIL（共通中間言語）と呼ばれる共通のコードに変換されます。変換されたコードはCLRで実行できるため、別の言語を使用してアプリを作ることが可能。  
ただし、基本的に.NET FrameworkはWindowsのOSでしか動作せず、使用できるプログラム言語もマイクロソフト社製のものが多い。

### WCF (Windows Communication Foundation)
ネットワークを介して異なるコンピュータで動作するソフトウェア間で通信することができるフレームワーク。

#### ABC
クライアントとサーバーで相互に通信する際のエンドポイントを定義する際の基本概念。

A：Address（アドレス）  
どのアドレスに対してメッセージを送るのか、あるいはどのアドレスでメッセージを受けるのか。

B：Binding（バインディング）  
どのようなトランスポート・プロトコルで通信し、どのようなエンコーディングをして、メッセージを送るまたは受け取るのか。

C：Contract（コントラクト）  
公開するサービスは何で、あるいは利用しようとするサービスは何で、そして交換するメッセージは何かを定義すること。

### 参考
- [Visual Basic\.NET（VB\.NET）とは？できることと活用シーンを入門者向けに解説！VBとの違いとは？ \| A\-STAR（エースター）](https://agency-star.co.jp/column/visual-basic.net/)
- [\.NETとは？基礎知識やできることをわかりやすく解説｜発注成功のための知識が身に付く【発注ラウンジ】](https://hnavi.co.jp/knowledge/blog/dotnet/)
- [WCFの基本的な概念：Windows Communication Foundation概説（1/2 ページ） \- ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/0604/26/news118.html)