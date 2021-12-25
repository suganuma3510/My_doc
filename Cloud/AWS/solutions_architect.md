## Solutions Architect

- [Solutions Architect](#solutions-architect)
  - [VPC](#vpc)
  - [S3 (Simple Storage Service)](#s3-simple-storage-service)
  - [EBS (Elastic Block Store)](#ebs-elastic-block-store)
  - [DynamoDB](#dynamodb)
  - [Auto Scaling](#auto-scaling)
  - [AWS Storage Gateway](#aws-storage-gateway)
  - [Amazon EFS (Amazon Elastic File System)](#amazon-efs-amazon-elastic-file-system)
  - [IAM](#iam)
  - [AWS DataSync](#aws-datasync)
  - [Amazon SQS (Simple Queue Service)](#amazon-sqs-simple-queue-service)
  - [AWS Config](#aws-config)
  - [RDS](#rds)
  - [Amazon FSx For Lustre](#amazon-fsx-for-lustre)
  - [Redshift](#redshift)
  - [ELB (Elastic Load Balancer)](#elb-elastic-load-balancer)
    - [ALB (Application Load Balancer)](#alb-application-load-balancer)
    - [NLB (Network Load Balancer)](#nlb-network-load-balancer)
  - [EC2](#ec2)
  - [ECS](#ecs)
  - [Amazon Kinesis Data Firehose](#amazon-kinesis-data-firehose)
  - [AWS KMS (Key Management Service)](#aws-kms-key-management-service)
  - [AWS CloudTrail](#aws-cloudtrail)

### VPC
- VPC間のデータ転送料  
プライベートIPアドレスは、データ転送料金はかからない。

### S3 (Simple Storage Service)
- S3 標準
- S3 標準 - 低頻度アクセス (S3 標準 -IA)  
アクセス頻度は低いが、必要に応じてすぐに取り出す際に適している。  
バックアップ、災害対策ファイルなどに最適。
- S3 Glacier (迅速取り出し)
- S3 Transfer Acceleration  
異なる地域からS3の高速データ転送が可能になる。  
世界中からアップロードされる、大陸間でGBからTB単位のデータ転送をする、アップロード時にインターネット経由で利用可能な帯域幅を十分に活用できていない際などに使用が推奨されている。

- ライフサイクルポリシー  
ライフサイクルを設定することでコスト効率を上げることができる。
  - 移行アクション  
  別のストレージクラスにオブジェクトを移行することができる。  
  例：30日経過後、S3 Glacierにアーカイブなど
  - 有効期限アクション  
  有効期限切れのオブジェクトを削除する。

- クロスリージョンレプリケーション  
S3のクロスリージョンレプリケーションを有効にすることで、複数のリージョン間でデータを複製することができる。  
また、レプリケーションを有効にするにはバケットでバージョニングを有効にする必要がある。

- CORS  
オリジン（protocol + domain + port『例：https://yahoo.co.jp:443』）間リソース共有のこと。  
あるオリジンで動いている Web アプリケーションに対して、別のオリジンのサーバーへのアクセスをHTTPリクエストによって許可できる仕組みのこと。  
[なんとなく CORS がわかる\.\.\.はもう終わりにする。 \- Qiita](https://qiita.com/att55/items/2154a8aad8bf1409db2b)

- 署名付きURL  
有効期限付きのURLを生成できるため、ユーザーがIAMユーザーである必要がなく、オブジェクトのアップロードが可能。  
また、アプリケーション経由でルーティングする必要がなく、S3へ直接アクセスできる。

- S3ファイルゲートウェイ  
NFSプロトコルをサポートしており、ローカルキャッシュを使用してデータへの低レイテンシーアクセスを提供する。
データへの低レイテンシーアクセスを維持したまま、オンプレからAWSへ移行したい際に利用する。

- MFA Delete  
この設定を有効にするとバケット所有者は特定のバージョンの削除や変更をする際に、2つの認証形態を含める必要がある。  
これにより誤った削除を防ぐことができる。

### EBS (Elastic Block Store)
どんな規模のワークロードにも対応でき、独自のファイルシステムも作成可能。

- ストレージオプション
  - プロビジョンド IOPS SSD (io1)  
  OLTPの要件に最適。
  - 汎用SSD (gp2)  
  - スループット最適化 HDD (st1)  
  - Cold HDD  

### DynamoDB
- DynamoDB ストリーム  
テーブル内の項目レベルの変更をキャプチャし、最大24時間のログを保存することができる。  
これによりほぼリアルタイムで変更前、変更後の内容を参照できるため、写真を追加した際に通知を送るなどの機能を実装することができる。

- パーティションキー  
RDBのプライマリキーのようなもの。データがどのパーティションに保存されているかを一意に決める。

- ソートキー  
パーティションの中で何かしらの並び替えを行う際に使用するキーのこと。

### Auto Scaling
自動的にリソースをスケールさせることができるサービス。  

- Auto Scaling グループ  
同じリージョン内の複数AZからEC2インスタンスなどを含めることができる。

### AWS Storage Gateway
- ボリュームゲートウェイ  
iSCSIProtocolを使用してブロックストレージを提供し、AWS上にストレージを拡張することができる
  - キャッシュ型モード  
プライマリデータはS3に保存され、**頻繁にアクセスするデータ**はキャッシュでローカルに保持される。  
データを全てS3に保存して、よく使うデータのみローカルでキャッシュしておくイメージ。
  - 保管型モード  
プライマリデータはローカルに保存され、**データセット全体**が低レイテンシーにアクセス可能になる。非同期にAWSにバックアップされる。  
ローカルにデータを残したままAWSにバックアップするイメージ。

- ファイルゲートウェイ  
業界標準のファイルプロトコル（NFS、SMBなど）を使用し、ファイルをオブジェクトとしてS3に保存、アクセスするためのファイルインターフェースを提供している。  

### Amazon EFS (Amazon Elastic File System)
ストレージをプロビジョニングまたは管理することなくファイルデータを共有できる完全マネージド型ファイルストレージサービス。  
複数のインスタンスから同時にアクセスできる。  

### IAM
- クロスアカウントアクセス  
AのアカウントからアカウントBのリソースを管理することができる。

### AWS DataSync
オンプレミスからAWS（Amazon S3 / Amazon EFS）間、およびAWSストレージサービス間でのデータの移動を簡素化、自動化、高速化するマネージド型のデータ転送サービス。

### Amazon SQS (Simple Queue Service)
サーバーレスでキューイングを実現できるフルマネージドキューイングサービス。  

- スケーリング
メッセージを永続的に保存する機能を備えた疎結合アーキテクチャの設計に役立つ。  
SQSキューの需要に応じてAuto Scalingグループをスケールすることができる。

### AWS Config
AWSリソースに対してどんな変更をしたか、時系列で変更履歴を追跡できるサービス。  
コンプライアンスに違反しているリソースの特定も可能。  

### RDS
- MySQL DBインスタンスでSSL接続  
プライマリインスタンスにSSL証明書をアタッチし、クライアントは接続に公開鍵を使用することでSSL接続をすることができる。

- IAM データベース認証  
MySQLおよびPostgreSQLで使用することができ、パスワード不要で一時的な認証トークンを使用してDBにアクセスすることができる。

### Amazon FSx For Lustre
ワークロードの高速処理に最適化された高性能ファイルシステムを提供するフルマネージド型サービス。  
機械学習、高性能コンピューティング、ビデオ処理、財務モデリング、電子設計自動化、分析などのワークロード向けに最適化されたファイルシステム。  
S3バケットとリンクすることもできる。並列処理も可能。

### Redshift
ペタバイト規模のマネージド型クラウド上のデータウェアハウス。  

- クラスターの暗号化
暗号化を有効にすることで、保存時のデータを保護することができる。  
クラスターとそのスナップショットのデータブロックとシステムメタデータが暗号化される。  
クラスター起動後に暗号化を有効にすることができない。KMSを使用して暗号化することも可能。

- ウェブIDフェデレーション  
一時的な認証情報を外部 ID プロバイダー（例: Login with Amazon、Facebook、Google）を使用してサインインし、その認証トークンをAWSアカウントのリソースを使用するためのアクセス許可を持つIAMロールにマッピングし、AWS の一時的セキュリティ認証情報に変換することができる。  
これを利用し、モバイルアプリなどでAWSリソースにアクセスすることができる。

### ELB (Elastic Load Balancer)
- クロスゾーン負荷分散  
複数のAZにまたがり、全インスタンスに均等にリクエストを分散する。  
ALB、NLB対応。


- スティッキーセッション  
セッションが続いている間は、同じクライアントを同じインスタンスへ誘導する。  
ALBのみ対応。


#### ALB (Application Load Balancer)
レイヤー7で対応。

- 登録解除の遅延  
ALBは応答がないインスタンスへのリクエストを停止するが、そのタイムアウト時間を遅延させることができる。

#### NLB (Network Load Balancer)
レイヤー4で対応。

### EC2
- インスタンスストア
ブロックレベルの一時ストレージを提供する。揮発性のためstopするとデータが失われる。  
インスタンスを休止状態にすると、RAMの内容がEBSルートボリュームに保存され、再起動するとRAMの内容が再読み込みされる。  
毎秒数百万回のトランザクションに対して最小のレイテンシーをサポートする。

### ECS
- EFSファイルシステムサポート
ECS on FargateのタスクはEFSのファイルシステムをマウントできる。

- 動的ポートマッピング
ALBで動的ポートマッピングを使用することで、1ホストに複数のタスク（コンテナの環境）をロードバランスすることができる。

### Amazon Kinesis Data Firehose
ストリーミングデータをリアルタイムで収集、処理、分析することができる完全マネージド型サービス。  
リアルタイムで取り込めるデータは以下の通り。
- 機械学習
- 動画
- 音声
- アプリケーションログ
- ウェブサイトのクリックストリーム
- IoT テレメトリーデータ

Kinesisに以下の4つの機能がある。
- Kinesis Video Streams  
動画を簡単かつ安全にストリーミングできるサービス。
- Kinesis Data Streams  
数十万規模のソースから秒あたり数ギガバイトものストリームデータを受けることができるサービス。
- Kinesis Data Firehose  
ストリームデータをS3やRedshiftなどのツールを使用してリアルタイムで分析ツールにできるサービス。
- Kinesis Data Analytics  
SQLやApache Finkでストリームデータをリアルタイムで処理できるサービス。

[Amazon Kinesis（ストリーミングデータをリアルタイムで収集、処理、分析）\| AWS](https://aws.amazon.com/jp/kinesis/)  
[Kinesis Data Firehoseを使ってみた話 \- Qiita](https://qiita.com/arata-honda/items/a21c5985f25ec337efbf)

### AWS KMS (Key Management Service)
データを暗号化するためのキーを作成および管理することができるサービス。  

- キーアクセス  
キーポリシーを使用することで、カスタマーマスターキー（CMKs）へのアクセスを制御することができる。  
またAWS CloudTrailと統合されており、すべてのキーの使用ログを表示できる。

### AWS CloudTrail
- ログファイルの暗号化と整合性  
CloudTrailはデフォルトでS3のログを暗号化し、ログファイルの整合性検証を行うことができる。