# 開発手法

## ウォータフォール型
最も代表的な開発手法。システム開発工程を上から順に開発していき、基本的には後に戻らない。前段階の工程が完璧でないと次の工程へ進めない。そのため、各工程では厳格なスケジュール管理、品質管理が求められる。納品物や責任範囲、スケジュールが明確にできるため、請負開発の契約に適している。また、大規模な開発に適している。

### メリット
- スケジュールを立てやすい
- 予算やSE（システムエンジニア）の手配がスムーズに行える
- 品質の担保がしやすい
- 大規模な開発に向いている

### デメリット
- 進行中に問題発生した時の手戻りが大きい
- WBSの作成に時間がかかる
- 不具合がテストまで見つからない場合が多い

### 参考
- [ウォーターフォール型開発とは？採用するメリット・デメリット、開発手順について解説 | Backlogブログ](https://backlog.com/ja/blog/advantages-and-disadvantages-for-waterfall-model/#i-4)
- [ウォーターフォール型開発のメリット6つ｜活用シーン3つを紹介 | 侍エンジニア塾ブログ（Samurai Blog） - プログラミング入門者向けサイト]( https://www.sejuku.net/blog/115156)
- [アプリ開発の基本的な流れと工程を紹介　ウォーターフォール開発とアジャイル開発の違いは？ | 株式会社モンスター・ラボ](https://monstar-lab.com/dp/blog/first-apps-develop-flow/)

## スパイラル型
ウォータフォール型のように開発工程を順に進めていくが、それらを繰り返し、各工程が正しいのか確認しながら開発する手法。繰り返し開発することで各工程の完成度を高めることができ、ウォータフォール型のように最後のテストまで不具合が見つからないという問題点がない。スパイラル型では、各工程にプロトタイピングが用意されている。

### プロトタイピング
簡単な試作品を開発し、ユーザによるプロトタイプの評価が行われてから本格的な設計を開始する。実際に成果物を作り、そのシステムのイメージを具体的にすることで、潜在的な問題や要求を見つけ出すことができる。メリットとして顧客の要件と開発者側の認識のずれや技術的な課題を早期に解決できるため、開発工程の大きな手戻りを防ぐことができる。

### メリット
- 開発スケジュール変更に対応しやすい
- 仕様変更に対応しやすい

### デメリット
- 開発の初期段階でプロジェクトの全体像を把握しづらい
- ユーザが新しい要件を提示してくる場合、システムが安定しない

### 参考
- [「アジャイル」と異なる反復型開発「スパイラル」とは | バンブロ！ソフトウェア品質特集](https://blogs.techvan.co.jp/quality/spiral)
- [前編　従来の開発プロセスと現場が抱える課題 - ITmedia エンタープライズ](https://www.itmedia.co.jp/im/articles/0201/22/news002.html)

## アジャイル型
初めから厳密な仕様は決めずに、短期間で開発を進めていく手法。短い間隔で同じ工程を繰り返し行うので動くものを早い段階で触ることができる、要求が変更になったときに応えやすい。主に小規模な開発や個人向けの新サービスの開発に使われることが多い。

イテレーションと呼ばれれる1〜4週間程度の期間内で一つの機能を開発・リリースする。期間は開発チームによって設定が変わる。アジャイル開発では仕様・要件ごとにスケジュールを設定して開発するため、全体スケジュールのコントロールが難しい。

### メリット
- 開発スピードが速い
- 臨機応変に柔軟な対応が可能
- 無駄な機能を開発するリスクが低い

### デメリット
- 全体スケジュールのコントロールが難しい
- 開発の方向性がブレやすい

### 参考
- [アジャイル型開発の重要性とは？従来のウォーターフォール型開発における課題を解決し、手戻り工数を削減！| コラム | 株式会社ヴェス](https://www.ves.co.jp/column/005/)
- [「ウォーターフォールモデル」「アジャイル開発」って何？二大開発手法のメリット・デメリットをまとめました | 東京のWeb制作会社LIG](https://liginc.co.jp/412896)
- [「アジャイル開発」とは？　特徴とメリット・デメリットをわかりやすく簡単に解説 | 株式会社モンスター・ラボ](https://monstar-lab.com/dp/blog/about-agile_methods/)
- [アジャイル開発とウォーターフォール開発の違いは何？アジャイル開発の手法や意味も要チェック | Backlogブログ](https://backlog.com/ja/blog/what-is-agile-and-waterfall/)