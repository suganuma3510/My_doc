## RDS (Relational Database Service)
AWS クラウドでリレーショナルデータベースを簡単にセットアップ、運用、拡張することのできるウェブサービス。  
自動バックアップはデフォルトで有効になっており、データベースとトランザクションログがバックアップされる。  
またストレージボリュームのスナップショットを自動で作成し、DBインスタンス全体をバックアップする。  
バックアップの設定はバックアップウィンドウを用いることでスケジュールを即時に変更できる。

### メリット
- 管理が簡単

- スケーラビリティが高い
- 可用性と耐久性が高い
- セキュア
- 高速
- 安価  
従量課金と定額制の２つの料金体制がある

### デメリット
- OSやミドルウェアの細かい設定ができない

### 使用できるデータベース
- Amazon Aurora
Amazonが提供しているリレーショナルデータベース。
MySQLおよびPostgreSQLと互換性がある、クラウド向けのリレーショナルデータベース。
標準的なMySQLデータベースと比べて最大で5倍、標準的なPostgreSQLデータベースと比べて最大で3倍高速。
[Amazon Aurora（高性能マネージドリレーショナルデータベース）\| AWS](https://aws.amazon.com/jp/rds/aurora/?aurora-whats-new.sort-by=item.additionalFields.postDateTime&aurora-whats-new.sort-order=desc)
- MySQL
- MariaDB
- PostgreSQL
- Oracle
  ライセンスは自身のライセンス（BYOL）とライセンス込みのオプションを選択できる。
- Microsoft SQL Server

### 参考
- [Amazon RDS（マネージドリレーショナルデータベース）\| AWS](https://aws.amazon.com/jp/rds/)
- [Amazon RDS バックアップと復元 \| クラウドリレーショナルデータベース \| アマゾン ウェブ サービス](https://aws.amazon.com/jp/rds/features/backup/)