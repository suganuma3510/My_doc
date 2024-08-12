- [ElasticSearch　クエリサンプル](#elasticsearchクエリサンプル)
  - [インデックス一覧表示](#インデックス一覧表示)
  - [インデックス設定表示](#インデックス設定表示)
  - [マッピング情報を取得](#マッピング情報を取得)
  - [入っているプラグインの一覧を取得](#入っているプラグインの一覧を取得)
  - [形態素解析](#形態素解析)
  - [全て検索](#全て検索)
  - [件数取得](#件数取得)
  - [指定した文字列のテキストを検索し、作成日の新しい順に並び替える](#指定した文字列のテキストを検索し作成日の新しい順に並び替える)
  - [エイリアス追加](#エイリアス追加)
  - [エイリアスの一覧を取得](#エイリアスの一覧を取得)
  - [kuromoji設定](#kuromoji設定)
  - [インデックスをクローズ](#インデックスをクローズ)
  - [インデックスをオープン](#インデックスをオープン)
  - [ダウンタイムを発生させずに　reindex　する](#ダウンタイムを発生させずにreindexする)

### ElasticSearch　クエリサンプル
#### インデックス一覧表示
```
GET _cat/indices?v
```

#### インデックス設定表示
```
GET index_name?pretty
```

#### マッピング情報を取得
```
GET index_name/_mapping
```

#### 入っているプラグインの一覧を取得
```
GET _cat/plugins
```

#### 形態素解析
```
GET index_name/_analyze
{
  "analyzer" : "kuromoji_normalize",
  "text" : "テキスト"
}
```

#### 全て検索
```
GET index_name/_search
{
  "query": {
    "match_all": {}
  }
}
```

#### 件数取得
```
GET index_name/_count
{
  "query": {
    "match_all": {}
  }
}
```

#### 指定した文字列のテキストを検索し、作成日の新しい順に並び替える
```
GET index_name/_search
{
  "query": {
    "match_phrase": {
      "text": "テスト"
    }
  },
    "sort": [
        {
            "created_at": {
                "order": "desc"
            }
        }
    ]
}
```

#### エイリアス追加
```
POST _aliases
{
  "actions" : [
    { "add" : { "index" : "index_name", "alias" : "alias_name" } },
    { "add" : { "index" : "index_name2", "alias" : "alias_name" } }
  ]
}
```

#### エイリアスの一覧を取得
```
GET _aliases?pretty
```

#### kuromoji設定
```
PUT index_name/_settings
{
  "index": {
    "analysis": {
      "analyzer": {
        "kuromoji_normalize": {
          "char_filter": [
            "icu_normalizer"
          ],
          "tokenizer": "kuromoji_tokenizer",
          "filter": [
            "kuromoji_baseform",
            "kuromoji_part_of_speech",
            "cjk_width",
            "ja_stop",
            "kuromoji_stemmer",
            "lowercase"
          ]
        }
      }
    }
  }
}
```

#### インデックスをクローズ
```
POST index_name/_close
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "indices" : {
    "index_name" : {
      "closed" : true
    }
  }
}
```

#### インデックスをオープン
```
POST index_name/_open
{
  "acknowledged" : true,
  "shards_acknowledged" : true
}
```

#### ダウンタイムを発生させずに　reindex　する
前提条件
1. Alias 経由で Index を参照していること

手順
1. 新しいマッピングのインデックスを作成

```
PUT posts_dest/
{
  "settings": {
    "number_of_shards": 1,
    "analysis": {
      "analyzer": {
        "kuromoji_analyzer": {
          "type": "custom",
          "char_filter": ["icu_normalizer"],
          "tokenizer": "kuromoji_tokenizer",
          "filter": [
            "kuromoji_baseform",
            "kuromoji_part_of_speech",
            "ja_stop",
            "kuromoji_number",
            "kuromoji_stemmer"
          ]
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "description": {
        "type": "text",
        "analyzer": "kuromoji_analyzer"
      }
    }
  }
}
```

2. インデックスを再構築

```
POST _reindex?refresh
{
  "source": {
    "index": "posts"
  },
  "dest": {
    "index": "posts_dest"
  }
}
```

3. マッピングを変更

```
POST _aliases?pretty
{
  "actions": [
    { "remove": { "index": "posts", "alias": "alias_name" } },
    { "add": { "index": "posts_dest", "alias": "alias_name" } }
  ]
}
```

4. 古いインデックスを削除

```
DELETE posts/
```
