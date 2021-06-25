# 技術用語集

### WebSocket
双方向リアルタイム通信を可能にするための一般的な方式。  

[WebSocketについて調べてみた。](https://qiita.com/south37/items/6f92d4268fe676347160)
[フロントエンドとバックエンドのリアルタイム通信の選択肢を教えて下さい](https://qiita.com/suin/items/00dee8bac706a6d66862)

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

### REST API

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