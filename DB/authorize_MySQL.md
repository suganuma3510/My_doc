## GRANTコマンドの使い方

#### ルートユーザでログインする
```
mysql -u root -p
```

実行結果
```
Setting environment for using XAMPP for Windows.
mikoto_suganuma@YAZ-DEL-ISP1500 c:\xampp
# mysql -u root -p
Enter password: **** //パスワードを入力
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.19-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

#### 登録されてるホストとユーザー名の確認

```
select user, host from mysql.user;
```

実行結果
```
MariaDB [(none)]> select user, host from mysql.user;
+------+-----------+
| User | Host      |
+------+-----------+
| root | 127.0.0.1 |
| root | ::1       |
| pma  | localhost |
| root | localhost |
+------+-----------+
4 rows in set (0.026 sec)

MariaDB [(none)]>
```

#### 特定のユーザーの権限確認

```
show grants for '[ユーザー名]'@'[ホスト名]'
```

実行結果
```
MariaDB [(none)]> show grants for 'root'@'localhost';
+----------------------------------------------------------------------------------------------------------------------------------------+
| Grants for root@localhost                                                                                                              |
+----------------------------------------------------------------------------------------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO `root`@`localhost` IDENTIFIED BY PASSWORD '*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7' WITH GRANT OPTION |
| GRANT PROXY ON ''@'%' TO 'root'@'localhost' WITH GRANT OPTION                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.001 sec)

MariaDB [(none)]>
```

#### 権限の付与

```
GRANT [権限] ON [適用対象のデータベース].[適用対象のテーブル] TO 'ユーザ名'@'ホスト名' IDENTIFIED BY 'パスワード';
```

このコマンドにより、既存でないユーザー名を書けば新たにユーザーが生成される。

-   [適用対象の～]は以下の4種類
    -   グローバルレベル：`GRANT 権限 ON *.* TO user;`
    -   データベースレベル：`GRANT 権限 ON db_name.* TO user;`
    -   テーブルレベル：`GRANT 権限 ON db_name.table_name TO user;`
    -   カラムレベル：`GRANT 権限 (カラム1, カラム2, ...) ON db_name.table_name TO user;`
-   ユーザー名は、既存のユーザーなら権限上書き、既存でないユーザーなら新しくユーザーが生成されて権限付与
-   `IDENTIFIED BY PASSWORD '****'`でパスワード設定

(例)

```
grant select, update on db_name.* to 'hoge_user'@'localhost' identified by 'passwd';
```

実行結果
```
MariaDB [(none)]> grant select, update on db_name.* to 'hoge_user'@'localhost' identified by 'pass';
Query OK, 0 rows affected (0.022 sec)

MariaDB [(none)]> show grants for 'hoge_user'@'localhost';
+------------------------------------------------------------------------------------------------------------------+
| Grants for hoge_user@localhost                                                                                   |
+------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `hoge_user`@`localhost` IDENTIFIED BY PASSWORD '*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7' |
| GRANT SELECT, UPDATE ON `db_name`.* TO `hoge_user`@`localhost`                                                   |
+------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]>
```

[権限]で指定できるコマンド一覧
|コマンド|適用単位|設定内容|
|:----|:----|:----|
|ALL|－|GRANT OPTION（権限の付与）以外の全てを許可する|
|ALTER|G, D, T|ALTER TABLE（テーブルの変更）の使用を許可する|
|ALTER ROUTINE|G, D, P|ストアドルーチンの変更・削除を許可する|
|CREATE|G, D, T|データベースとテーブルの作成を許可する|
|CREATE ROUTINE|G, D|ストアドルーチンの作成を許可する|
|CREATE TABLESPACE|G|テーブルスペースとログファイルグループの作成を許可する|
|CREATE TEMPORARY TABLES|G, D|一時テーブル作成の使用を許可する|
|CREATE USER|G|ユーザの作成・変更・削除を許可する|
|CREATE VIEW|G, D, T|ビューの作成や変更を許可する|
|DELETE|G, D, T|DELETE文の使用を許可する|
|DROP|G, D, T|DROP文の使用を許可する|
|EVENT|G, D|イベントスケジューラのイベント作成を許可する|
|EXECUTE|G, D, T|ストアドルーチンの実行を許可する|
|GRANT OPTION|G, D, P|権限の付与を許可する|
|INDEX|G, D, T|インデックスの作成と削除を許可する|
|INSERT|G, D, T, C|INSERT文の使用を許可する|
|LOCK TABLES|G, D|SELECT権限を持つテーブルのロックを許可する|
|PROCESS|G|プロセスリストの表示を許可する|
|RELOAD|G|FLUSHの使用を許可する|
|SELECT|G, D, T, C|SELECT文の使用を許可する|
|SHOW DATABASES|G|SHOW DATABASEで全データベースの表示を許可する|
|SHUTDOWN|G, D, T|mysqladmin shutdownの使用を許可する|
|TRIGGER|G, D, T|トリガの作成・削除を許可する|
|UPDATE|G, D, T, C|UPDATE文の使用を許可する|
|USAGE|－|「権限なし」を設定する|

#### 参考文献

[[MySQL]権限の確認と付与](https://qiita.com/shuntaro_tamura/items/2fb114b8c5d1384648aa)
[MySQLでユーザを作成し、権限を設定する方法](https://proengineer.internous.co.jp/content/columnfeature/6638)
