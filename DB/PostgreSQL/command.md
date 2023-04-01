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

### Role 作成
```
CREATE ROLE postgres WITH LOGIN PASSWORD 'password';
```

### Role 削除
```
¥du
drop role user;
¥dt+
```

### 権限付与
```
GRANT ALL ON ALL TABLES IN SCHEMA public TO postgres;
```

### ダンプファイルのインポート
```
psql -U postgres dbname < /tmp/db_20230101.dmp
```

### ファイルからSQL実行
```
psql -U postgres -d dbname -f /tmp/00_ALL.sql
```

### function get_random_uuid() does not exist エラー対策
```
CREATE EXTENSION pgcrypto;
```

### スキーマ削除
```
psql -U postgres -c 'DROP SCHEMA public CASCADE; CREATE SCHEMA public;'
```

### テーブルオーナー変更SQL出力
```
SELECT
    'ALTER TABLE ' || schemaname
    || '.' || tablename ||
    ' OWNER TO target_owner;'
FROM pg_tables
WHERE tableowner ='souce_owner';
```