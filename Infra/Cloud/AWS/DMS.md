##　AWS DMS の運用方法


### 前提条件
- AWS DMS v3.4.7
- Amazon Aurora MySQL5.7 （ソース）
- Amazon OpenSearch v1.3（ターゲット）
- 移行タイプは「Full load and CDC」 

### 参考
- [AWS Database Migration Service とは? \- AWS Database Migration Service](https://docs.aws.amazon.com/ja_jp/dms/latest/userguide/Welcome.html)
- [AWS Database Migration Service のベストプラクティス \- AWS Database Migration Service](https://docs.aws.amazon.com/ja_jp/dms/latest/userguide/CHAP_BestPractices.html)
- [Amazon OpenSearch サービスクラスターをターゲットとして使用するAWS Database Migration Service \- AWS Database Migration Service](https://docs.aws.amazon.com/ja_jp/dms/latest/userguide/CHAP_Target.Elasticsearch.html)
- [AWS Database Migration Serviceのターゲットとしての Amazon Elasticsearch Service の導入 \| Amazon Web Services ブログ](https://aws.amazon.com/jp/blogs/news/introducing-amazon-elasticsearch-service-as-a-target-in-aws-database-migration-service/)
- [変換ルール式を使用した列の内容の定義 \- AWS Database Migration Service](https://docs.aws.amazon.com/ja_jp/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.SelectionTransformation.Expressions.html#CHAP_Tasks.CustomizingTasks.TableMapping.SelectionTransformation.Expressions-SQLite)

### タスク失敗時のリカバー方法
基本的に人の手が介入しなければいけない致命的なエラー以外は、DMSがタスクを継続できるように自動で再試行してくれる。

また、タスクエラーが発生した際の処理動作を設定することができる。
例えば、レコードレベルでデータの同期に失敗した際は、タスクを停止させる、もしくはタスクは継続させログに書き込むといった設定やが可能。他に再試行の回数や時間等細かな設定が可能。

細かな設定に関しては以下を参照。

参考
- [再試行しない AWS DMS タスクをトラブルシューティングする \| AWS re:Post](https://repost.aws/ja/knowledge-center/dms-task-not-retrying)
- [エラー処理タスクの設定 \- AWS Database Migration Service](https://docs.aws.amazon.com/ja_jp/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.ErrorHandling.html)

### データの移行漏れが発生した際の対応方法
データベー移行タスクの作成時に「検証の有効化」オプションを有効化にするとデータがソースからターゲットに正確に移行されたことを確認できる。

ただし、OpenSearchをターゲットとしたデータ検証はサポートされていない模様。
そのため、それぞれのデータ件数を手動で比較して欠損がないかを確認する。

欠損あった場合、DMSログやメトリクスを確認し原因を特定、対応する。
もしくはサービスの要件によるが、移行漏れによって多少検索に引っかからないデータがあったとしても許容できるか。

参考
- [AWS DMS データ検証 \- AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Validating.html?icmpid=docs_DMS_help_panel_hp-dms-classic-tasksettings-validation-on)