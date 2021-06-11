# PHP

#### PHPにはAPサーバがいらない

JavaにはtomcatというAP(アプリケーション)サーバを使ったが、
PHPの場合はAPサーバを使う必要がない。

#### PHPはAPサーバ無しで動いているのか？

実はそうではなく、Apacheがアプリケーションサーバも兼ねている。
Apacheには`mod_php`というモジュールを追加することでAPサーバの役割を持つことができる。

#### nginxではどう動かすのか

[php-fpm](https://www.php.net/manual/ja/install.fpm.php)を使用することでPHPの実行が可能な環境を構築することができる。

#### 参考文献

[PHPのアプリケーションサーバとは？ Web3層構成を簡単に解説します](https://www.sejuku.net/blog/96713)
[APサーバの役割とは？Webサーバとの違いをしっかり理解しよう！](https://kitsune.blog/ap-server-summary)
[PHPの「アプリケーションサーバー」について](https://qiita.com/andrew954/items/2fa78e9f7f83bd8cb9ac)
[nginx と PHP-FPM の仕組みをちゃんと理解しながら PHP の実行環境を構築する](https://qiita.com/kotarella1110/items/634f6fafeb33ae0f51dc)