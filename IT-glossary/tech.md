## 技術用語集

- [技術用語集](#技術用語集)
  - [WebAPI](#webapi)
  - [REST API](#rest-api)
    - [REST (REpresentational State Transfer)](#rest-representational-state-transfer)
  - [パッケージマネージャー](#パッケージマネージャー)
  - [クラウド (Cloud)](#クラウド-cloud)
  - [クラウドアーキテクチャ](#クラウドアーキテクチャ)
  - [WebSocket](#websocket)
  - [SPA(Single Page Application)](#spasingle-page-application)
  - [SSR(Server Side Rendering)](#ssrserver-side-rendering)
  - [マイクロサービス（Microservices）](#マイクロサービスmicroservices)
  - [SEO](#seo)
    - [検索ボリューム](#検索ボリューム)
  - [クローラー](#クローラー)
  - [アクセス解析](#アクセス解析)
    - [Googleアナリティクス (GA)](#googleアナリティクス-ga)

### WebAPI
何かしらのサービス提供者が、そのサービスを利用するために HTTP/HTTPS ベースで、提供するインターフェースのこと。

### REST API
RESTと呼ばれる設計原則に従って作られたWebAPIのこと。
RESTfulなAPIとは一つのモデルのCRUD操作に対して一つのURLに対応されている。

#### REST (REpresentational State Transfer)
Webサービスの設計モデルであり、以下のような設計原則がある。
- アドレス指定可能なURIで公開されていること
- インターフェース(HTTPメソッドの利用)の統一がされていること
- セッション管理や状態管理などは行わない（ステートレス）
- 処理結果がHTTPステータスコードで通知されること

[Webサービスの設計モデル](https://qiita.com/TakahiRoyte/items/949f4e88caecb02119aa)  
[0からREST APIについて調べてみた \- Qiita](https://qiita.com/masato44gm/items/dffb8281536ad321fb08)  
[RESTful API（REST API）とは \- IT用語辞典 e\-Words](https://e-words.jp/w/RESTful_API.html)

### パッケージマネージャー
OSやプログラミング言語の各パッケージのインストールやアンインストールを行うツールのこと。  

プログラミング言語のツール例
- npm (Node.js)
- gem (Ruby)
- Composer (PHP)

OSのツール例
- yum (Linux RedHot系)
- PackageManagemet (Windows)
- apt-get (Linux Debian系)

[バージョン管理ツール、パッケージ管理ツールの種類をまとめました \- Qiita](https://qiita.com/akkey2475/items/5b2813e62303a9c75813)

### クラウド (Cloud)
クラウドサービスプラットフォーム(AWS や GCP など)からインターネット経由でコンピューティング、データベース、ストレージ、アプリケーションをはじめとした、さまざまなIT リソースをユーザーの要求があった際に、その要求に応じてサービスを提供、利用することができるサービスの総称。

### クラウドアーキテクチャ
クラウドを構築するために必要なものをつなぎ合わせ、アプリケーションが実行する環境を作るための設計思想のようなもの。

### WebSocket
双方向リアルタイム通信を可能にするための一般的な方式。  

[WebSocketについて調べてみた。](https://qiita.com/south37/items/6f92d4268fe676347160)  
[フロントエンドとバックエンドのリアルタイム通信の選択肢を教えて下さい](https://qiita.com/suin/items/00dee8bac706a6d66862)

### SPA(Single Page Application)
単一のWebページでコンテンツ切り替えを行うことで、ページ遷移の必要がなく、ブラウザの挙動に縛られないWeb表現を可能にする設計構造の名称。  
メリットとして、ページ遷移が高速・高度な UI/UX が実現可能・ネイティブアプリの代用などがある。  
デメリットはSEOの低下、初期ローディングに時間がかかるなど。

### SSR(Server Side Rendering)
本来JavaScriptで行う画面の書き換え処理などをサーバー側で実行させて、ユーザーの待機時間を短くすること。  
ユーザー側ではなく、サーバー側でJavaScriptを使ったHTML生成を行うためユーザー側でHTMLを生成する待ち時間がなくなる。  

[Nuxt.jsを使うときに、SPA・SSR・静的化のどれがいいか迷ったら](https://qiita.com/nishinoshake/items/f42e2f03663b00b5886d)  
[SSR（サーバーサイドレンダリング）とは](https://qiita.com/negi524/items/40166176a8fb7186c9b2)

### マイクロサービス（Microservices）
個々に開発された複数の小さな（マイクロ）サービスを連携させて管理、運営をおこなっていくソフトウェアのアーキテクチャ。  

マイクロサービスは、1サービスを1プロセスとして稼働させる仕組みをとっています。  
サービス同士はAPIによって最小限の連携をもつのみで、基本的にはそれぞれ独立しています。  そのため、設計にあたってはそれぞれのサービスに特化した手法をとることができます。  
また、障害が起きた時は1つのサービスごとに影響をチェック可能。

[事例つき！マイクロサービスとは？基礎知識からメリットとデメリットまでを解説](https://ec-orange.jp/ec-media/?p=23458)  
[マイクロサービス化・Microservices事例集](https://qiita.com/piaro/items/e82ee7f257be2ae37068)

### SEO
Search Engine Optimization:検索エンジン最適化  
特定のウェブサイトが上位に表示されるよう、  
ウェブサイトの構成などを調整すること。

#### 検索ボリューム
GoogleやYahooなどの検索エンジンで検索されたキーワードの検索回数のこと。
ブログ・Webサイトのアクセス数を増やす際に、最も重要となる数字。

[Search Engine Optimization, 検索エンジン最適化](https://webtan.impress.co.jp/g/seo)

### クローラー
インターネット上に存在するWebサイトや画像などのあらゆる情報を取得し、  
自動的に検索データベースを作成する巡回プログラムのこと。

クローリングの対象
クローラーのサーバーとの通信手段は「HTTP/HTTPSプロトコル」なので、  
HTTP/HTTPSで取得できる情報は、すべてクローリングの対象となる。

- テキストファイル
- CSSファイル
- JavaScriptファイル
- 画像
- Flash
- PDF

検索エンジンのクローラー
- Googlebot（Google）
- Bingbot（マイクロソフトが運営するbing）
- Yahoo Slurp（日本以外のYahoo!）
- Baiduspider（百度）
- Yetibot（Naver）

[クローラーとは？SEOに必要な基礎知識とクローリングを最適化する方法](https://innova-jp.com/3711/)

### アクセス解析
Webサイトへのアクセスに対して様々な視点から分析を図り、サイトの状況を把握すること。

どういったことを分析するのか
- どんなユーザーが多いか(性別、年齢、興味関心、地域など)
- どこからサイトを訪れてきているか(検索、広告、外部リンクなど)
- サイトを訪れた際に一番最初に見たページ
- よく見られているページ
- サイトを離脱したページ
- CV (設定した最終地点に顧客やユーザーが着地する数) データ

#### Googleアナリティクス (GA)
Googleが提供する無料のWebサイトアクセス解析ツール。

- [【GAとは？】Googleアナリティクスの導入方法・使い方を分かりやすく解説](https://digitalidentity.co.jp/blog/analytics/what-googleanalytics.html)
- [設定した最終地点に顧客やユーザーが着地する数](https://www.profuture.co.jp/mk/column/8792)