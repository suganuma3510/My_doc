## Solutions Architect

- [Solutions Architect](#solutions-architect)
  - [S3 (Simple Storage Service)](#s3-simple-storage-service)
  - [AWS Storage Gateway](#aws-storage-gateway)
  - [AWS DataSync](#aws-datasync)
  - [Amazon SQS (Simple Queue Service)](#amazon-sqs-simple-queue-service)
  - [AWS Config](#aws-config)
  - [Redshift](#redshift)
  - [EC2](#ec2)
  - [ECS](#ecs)
  - [Amazon Kinesis Data Firehose](#amazon-kinesis-data-firehose)

### S3 (Simple Storage Service)
- クロスリージョンレプリケーション  
S3のクロスリージョンレプリケーションを有効にすることで、複数のリージョン間でデータを複製することができる。  
また、レプリケーションを有効にするにはバケットでバージョニングを有効にする必要がある。

- CORS  
オリジン（protocol + domain + port『例：https://yahoo.co.jp:443』）間リソース共有のこと。  
あるオリジンで動いている Web アプリケーションに対して、別のオリジンのサーバーへのアクセスをHTTPリクエストによって許可できる仕組みのこと。  
[なんとなく CORS がわかる\.\.\.はもう終わりにする。 \- Qiita](https://qiita.com/att55/items/2154a8aad8bf1409db2b)

- 署名付きURL  
有効期限付きのURLを生成できるため、ユーザーがIAMユーザーである必要がなく、オブジェクトのアップロードが可能。

- S3ファイルゲートウェイ  
NFSプロトコルをサポートしており、ローカルキャッシュを使用してデータへの低レイテンシーアクセスを提供する。
データへの低レイテンシーアクセスを維持したまま、オンプレからAWSへ移行したい際に利用する。

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

### Redshift
ペタバイト規模のマネージド型クラウド上のデータウェアハウス。  

- クラスターの暗号化
暗号化を有効にすることで、保存時のデータを保護することができる。  
クラスターとそのスナップショットのデータブロックとシステムメタデータが暗号化される。  
クラスター起動後に暗号化を有効にすることができない。

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