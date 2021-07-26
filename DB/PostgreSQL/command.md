# PostgreSQLコマンド

#### ログイン
```
psql -h localhost -p 5432 -U root -d company_directory
```

#### テーブル一覧表示
```
\z
```

#### テーブル定義を確認
```
\d tablename
```

### レコードを全件取得
```
select * from employee;
```