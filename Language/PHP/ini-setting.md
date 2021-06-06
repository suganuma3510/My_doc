# php.iniの設定

## [](https://qiita.com/ucan-lab/items/0d74378e1b9ba81699a9#%E5%8F%82%E8%80%83%E8%A8%AD%E5%AE%9A)参考設定

PHPでは、開発用と本番用の設定例を用意してくれています。  

-   [https://github.com/php/php-src/blob/master/php.ini-development](https://github.com/php/php-src/blob/master/php.ini-development)
-   [https://github.com/php/php-src/blob/master/php.ini-production](https://github.com/php/php-src/blob/master/php.ini-production)

予め以前の記事で設定の差分を調べておきましたので、よかったらご覧ください。

-   [PHP7.4 開発用と本番用の php.ini 設定の違い](https://qiita.com/ucan-lab/items/86f1498de569f4a5e16b)

## 環境

-   PHP 7.4.5 (執筆時のバージョンです。)

※バージョンが異なる場合は公式サイトで有効な設定か確認してください。

### 開発用 php.ini の例

php.ini

```
zend.exception_ignore_args = off
expose_php = on
max_execution_time = 30
max_input_vars = 1000
upload_max_filesize = 64M
post_max_size = 128M
memory_limit = 256M
error_reporting = E_ALL
display_errors = on
display_startup_errors = on
log_errors = on
error_log = /var/log/php/php-error.log
default_charset = UTF-8

[Date]
date.timezone = Asia/Tokyo

[mysqlnd]
mysqlnd.collect_memory_statistics = on

[Assertion]
zend.assertions = 1

[mbstring]
mbstring.language = Japanese
```

### 本番用 php.ini の例

php.ini

```
zend.exception_ignore_args = on
expose_php = off
max_execution_time = 30
max_input_vars = 1000
upload_max_filesize = 64M
post_max_size = 128M
memory_limit = 256M
error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT
display_errors = off
display_startup_errors = off
log_errors = on
error_log = /var/log/php/php-error.log
default_charset = UTF-8

[Date]
date.timezone = Asia/Tokyo

[mysqlnd]
mysqlnd.collect_memory_statistics = off

[Assertion]
zend.assertions = -1

[mbstring]
mbstring.language = Japanese

[opcache]
opcache.enable = 1
opcache.memory_consumption = 128
opcache.interned_strings_buffer = 8
opcache.max_accelerated_files = 4000
opcache.validate_timestamps = 0
opcache.huge_code_pages = 0
opcache.preload = /var/www/preload.php
opcache.preload_user = www-data
```

## オプションの補足

### zend.exception\_ignore\_args

-   開発 は `off`、本番 は `on`
-   有効にすると例外のスタックトレースに引数情報が出なくなる
-   PHP7.4以降の設定

### expose\_php

-   開発 は `on`、本番 は `off`
-   有効にするとHTTPヘッダに `X-Powered-By: PHP/7.4.5` とPHPのバージョン情報が表示されます。

### max\_execution\_time

-   設定値: 30(秒) デフォルト: 30(秒)
-   1リクエストあたりの最大実行時間（秒）
-   コマンドラインから実行する場合のデフォルト設定は 0 です。
-   サーバーの負荷を上げることを防止するのに役立ちます。

重たい処理を実行するとこの設定で引っかかるので、その場合はそのコードだけ特別に[set\_time\_limit](https://www.php.net/manual/ja/function.set-time-limit.php)を呼んであげると良いかもです。

### max\_input\_vars

-   設定値: 1000(個) デフォルト: 1000(個)
-   1リクエストで受け付ける最大の入力変数の数
-   `$_GET`, `$_POST`, `$_COOKIE` それぞれ個別に適用されます。
-   設定値を超える場合は `E_WARNING` が発生し、以降の入力変数はリクエストから削除されます。

入力フォームが気が狂ったように多い画面とかは1000超えるかも😇

### upload\_max\_filesize

-   設定値: 20M デフォルト: 2M
    -   設定する単位に[短縮表記](https://www.php.net/manual/ja/faq.using.php#faq.using.shorthandbytes)を使えます
-   アップロードされるファイルの最大サイズ。

スマホの写真サイズも大きいので多めにした方が良き

### post\_max\_size

-   設定値: 128M デフォルト: 8M
    -   upload\_max\_filesize の設定値より大きくする必要がある。
-   POSTデータに許可される最大サイズを設定します。
-   ファイルアップロードにも影響します。

### memory\_limit

-   設定値: 256M デフォルト: 128M
    -   post\_max\_size の設定値より大きくする必要がある。
    -   memory\_limit > post\_max\_size > upload\_max\_filesize
-   1リクエストあたりの最大メモリ使用量

メモリ設定はサーバーやプロジェクトによるかと思います。  
最初から大量に確保するのではなく、必要に応じて上げていくのが良いのかなと思います。

### error\_reporting

-   開発 は `E_ALL`、本番 は `E_ALL & ~E_DEPRECATED & ~E_STRICT`
-   `E_ALL` は 全ての PHP エラーを表示する
-   `E_ALL & ~E_DEPRECATED & ~E_STRICT` は 非推奨の警告エラーを除く PHP エラーを表示する。
    -   `E_DEPRECATED` は コードの相互運用性や互換性を維持するために PHP がコードの変更を提案する。
    -   `E_STRICT` は 実行時の注意、将来のバージョンで動作しなくなるコードについて警告する。

### display\_errors

-   開発 は `on`、本番 は `off`
-   エラーをHTML出力の一部として画面に出力するかどうかを定義します。
-   セキュリティ上、本番では `off` 推奨

### display\_startup\_errors

-   開発 は `on`、本番 は `off`
-   `display_errors` を `on` にした場合でも、PHPの起動シーケンスにおいて発生したエラーは表示されません。
-   セキュリティ上、本番では `off` 推奨

### log\_errors

-   エラーメッセージを、サーバーのエラーログまたはerror\_logに記録するかどうかを指します。
-   このオプションはサーバーに依存します。

### error\_log

-   スクリプトエラーが記録されるファイル名です。

### default\_charset = UTF-8

-   設定値: UTF-8 デフォルト: UTF-8
-   デフォルト文字コード設定

PHP 5.6.0 以降は "UTF-8" がデフォルトになりますが、念のため明示的に指定します。

### date.timezone

-   設定値: Asia/Tokyo デフォルト: GMT
-   全ての日付/時刻関数で使用されるデフォルトのタイムゾーン。

### mysqlnd.collect\_memory\_statistics

-   開発 は `on`、本番 は `off`
-   さまざまなメモリ統計情報の収集を有効にします。
-   `phpinfo()` で `mysqli` の統計情報を出力するかどうか

### zend.assertions

-   開発 は `1`、本番 は `-1`
-   アサーションのコードを生成して実行します
-   1 アサーションのコードを生成して実行します (開発モード)
-   0 アサーションのコードは生成しますが実行時にはスキップします (実行しません)
-   \-1 アサーションのコードを生成せず、アサーションのコストがゼロになります (実運用モード)

### mbstring.language

-   設定値: Japanese デフォルト: neutral
-   mbstring で使用される言語設定のデフォルト値。

### opcache の設定

本番のみ有効にします。  
opcacheするとソースコードのキャッシュ、最適化して高速化が見込めます。

ソースコードを変更してもサーバーを再起動しないと変更が反映されなくなるため開発時は使用しません。

### opcache.enable

-   オペコード・キャッシュを有効にします。

### opcache.memory\_consumption

-   OPcache によって使用される共有メモリ・ストレージのサイズ(MB単位)

### opcache.interned\_strings\_buffer

-   インターン (intern) された文字列を格納するために使用されるメモリ量。（MB単位）

### opcache.max\_accelerated\_files

-   OPcache ハッシュテーブルのキー（すなわちスクリプト）の最大数

### opcache.validate\_timestamps

-   有効にすると、OPcache は、スクリプトが更新されたか opcache.revalidate\_freq 秒ごとにチェックします。
-   無効にすると、スクリプトの更新をチェックしません。

### opcache.huge\_code\_pages

-   PHPコード(textセグメント)を HUGE PAGE にコピーする機能を有効にしたり、無効にしたりできます。
-   これにより、パフォーマンスは向上するはずですが、適切なOSの設定が必要です。

※適切なOS設定がいまいちわからなかったので、この設定は無効化しています。

### opcache.preload

-   サーバが起動した際にコンパイルされ、実行されるPHPスクリプトを指定します。
-   PHP7.4以降の設定

※ここはプロジェクトに合わせて自前で用意する必要があります。これは無理に設定しなくてもokと思います。  
※Laravelの場合はこちらのコードを参考にしています。 [https://github.com/brendt/laravel-preload/blob/master/preload.php](https://github.com/brendt/laravel-preload/blob/master/preload.php)

### opcache.preload\_user

-   root ユーザでコードをあらかじめロードすることは、セキュリティ上の理由から禁止されています。
-   PHPの実行ユーザーを指定します。
-   PHP7.4以降の設定
-   [Fatal Error "opcache.preload\_user" has not been defined](https://qiita.com/ucan-lab/items/cca05a4768f0efcaf3ec)

## 参考

-   [ぼくのかんがえたさいきょうの](https://dic.pixiv.net/a/%E3%81%BC%E3%81%8F%E3%81%AE%E3%81%8B%E3%82%93%E3%81%8C%E3%81%88%E3%81%9F%E3%81%95%E3%81%84%E3%81%8D%E3%82%87%E3%81%86%E3%81%AE)
-   [php.ini ディレクティブのリスト](https://www.php.net/manual/ja/ini.list.php)
-   [OPcache インストール手順](https://www.php.net/manual/ja/opcache.installation.php)
