### cron (クロン)
UNIX系OS(Linuxなど)で、指定されたプログラムを定期的に実行する際に使用する機能。  
使用する際は`crontab`コマンドで実行したいプログラムと日時を指定することで、同名のファイルに設定が保存される。

メリット
- 指定したプログラムの動作を予約できる
- 実行する頻度を細かく調整できる
- サーバー管理者の負担とミスが減る

```
# 毎時10分と30分（カンマで複数指定可）
0,30 * * * * ~/media/pi/FileDelete.sh
```

[cronとは \- IT用語辞典 e\-Words](https://e-words.jp/w/cron.html)  
[【入門】cron（クロン）設定・書き方の基本 \| カゴヤのサーバー研究室](https://www.kagoya.jp/howto/rentalserver/cron/)