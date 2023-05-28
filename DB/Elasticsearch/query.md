## Elasticsearch クエリ

### インデックス一覧表示
```
GET _cat/indices?v
```

### OpenSearch検索スロークエリの設定
```
PUT index_name/_settings
{
  "index.search.slowlog.threshold.query.warn": "3000ms",
  "index.search.slowlog.threshold.query.info": "1000ms"
}
```

### リフレッシュインターバルの設定
```
PUT index_name/_settings
{
  "index.refresh_interval": "30s"
}
```

### インデックスの設定表示
```
GET index_name/_settings?pretty
```

### 日付型をフォーマット
```
GET index_name/_search
{
  "query": {
    "match": {
      "description": "テスト"
    }
  },
  "sort": [
    {
      "post_at": {
        "order": "desc"
      }
    }
  ],
  "docvalue_fields": [
  "id",
  {
    "field" : "post_at",
    "format" : "yyyy-MM-dd HH:mm:ss"
  }]
}
```