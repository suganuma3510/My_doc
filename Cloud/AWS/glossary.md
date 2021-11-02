## AWS用語集

- [AWS用語集](#aws用語集)
  - [VPC (Virtual Private Cloud)](#vpc-virtual-private-cloud)
  - [EC2 (Elastic Compute Cloud)](#ec2-elastic-compute-cloud)
  - [EBS (Elastic Block Store)](#ebs-elastic-block-store)
  - [S3 (Simple Storage Service)](#s3-simple-storage-service)
    - [オブジェクトストレージ](#オブジェクトストレージ)
  - [Route 53](#route-53)
  - [ACM (AWS Certificate Manager)](#acm-aws-certificate-manager)
  - [ALB (Application Load Balancer)](#alb-application-load-balancer)
  - [RDB (Relational Database Service)](#rdb-relational-database-service)
  - [ECS (Elastic Container Service)](#ecs-elastic-container-service)
  - [ECR (Elastic Container Registry)](#ecr-elastic-container-registry)
  - [Fargate](#fargate)
  - [Lambda](#lambda)
  - [IAM (Identity and Access Management)](#iam-identity-and-access-management)
  - [参考](#参考)

### VPC (Virtual Private Cloud)
ユーザー専用の仮想のクラウド環境を構築しプライベートなネットワーク空間を提供するサービス。

### EC2 (Elastic Compute Cloud)
仮想サーバを構築できるサービス。LinuxやWindowsなど様々なOSの仮想サーバを立てることができる。  
必要な分だけ仮想サーバーを起動して、セキュリティやネットワーキングの設定、ストレージの管理をすることができる。  
また、EC2では要件が変更した場合や需要が増加した場合なども、必要に応じて迅速に容量のスケールアップやスケールダウンをすることができる。  
インスタンスの種類が数多くあり、用途に応じて選択することができる。

### EBS (Elastic Block Store)
EC2インスタンスにアタッチして使用するためのブロックストレージのこと。  
高い可用性や大規模なワークロードにも対応している。  
なお1つのEC2から複数のEBSには接続できるが、その逆はできない。  
また、AZを超えた接続もできない。

- [よく聞くEBSってなに？ \- Qiita](https://qiita.com/miyuki_samitani/items/20a1d74657668578180b)

### S3 (Simple Storage Service)
スケーラビリティ、可用性、セキュリティ、パフォーマンスを高いレベルで実現するオブジェクトストレージサービスのこと。  
世界中で利用されており、Webアプリやバックアップ、静的ファイルの配信、IoTデバイスやビッグデータ分析など様々な用途で活用されている。

#### オブジェクトストレージ
データを「オブジェクト」という単位で扱う記憶装置のこと。  
ディレクトリ構造で管理するファイルストレージとは異なり、データサイズやデータ数の保存制限がないため、大容量データの保存に適している。  
オブジェクトにはストレージシステムのなかで固有のID（URI）が付与され、このIDでデータを出し入れする。

- [AWSの S3って何？ 初心者でも分かる簡単用語解説 \| WafCharm（ワフチャーム） \- AIによるAWS / Azure WAFのルール自動運用サービス](https://www.wafcharm.com/blog/s3-for-beginners/)
- [5分で絶対に分かるオブジェクトストレージ：5分で絶対に分かる（3/5 ページ） \- ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1705/29/news014_3.html)
- [オブジェクトストレージとは : 富士通](https://www.fujitsu.com/jp/products/computing/storage/lib-f/tech/beginner/object-storage/)

### Route 53
可用性と拡張性に優れたクラウドのドメインネームシステム (DNS) ウェブサービス。  
IP アドレスの変換だけでなく、新規ドメイン名の登録やドメインの DNS レコードの管理も行える。

### ACM (AWS Certificate Manager)
AWS が提供している SSL 証明書とキーの作成、保存、更新が行えるサービス。

### ALB (Application Load Balancer)
Web サービスに発生する負荷を分散するロードバランシングサービス。

### RDB (Relational Database Service)
クラウド上で提供されるリレーショナル型データベースサービス。

### ECS (Elastic Container Service)
Dockerオーケストレーションツール。  
EC2 インスタンスを用いて仮想サーバー構築によく用いられる Docker コンテナを簡単に実行、停止、管理できる非常にスケーラブルで高速な管理サービス。  
開発者はコンテナを動かすことに集中できるよう開発されていてクラスターの管理はAWSが行う。  
そのため、プロダクションで活用するまでの学習コストが低く、他のAWSサービスとの連携もしやすいことが特徴。

- タスク定義
  - どんなコンテナをどんな設定で動かすかを定義する
- サービス
  - どのタスク定義でコンテナを立ち上げ、そのコンテナとどのロードバランサ(ターゲットグループ, リスナー)と紐付けるか
- タスク
  - タスク定義をもとに起動したコンテナをタスクと呼ぶ

開発者がECSを使用する際は「タスク定義を作成し、そのタスク定義をもとにサービスを起動」する流れ。

- [Amazon ECS タスク定義 \- Amazon Elastic Container Service](https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/task_definitions.html)
- [チュートリアル: AWS CLI を使用した Fargate タスクのクラスターの作成 \- Amazon Elastic Container Service](https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ECS_AWSCLI_Fargate.html)
- [Amazon ECS task execution IAM role \- Amazon Elastic Container Service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)

### ECR (Elastic Container Registry)
Docker コンテナイメージを簡単に保存、管理、デプロイできる完全マネージド型のコンテナレジストリ。

### Fargate
AWS が提供するマネージドなコンテナ実行環境。  
コンテナを実行するサーバーを直接意識する必要がなく、サーバーのインスタンスタイプの選択やクラスタ管理がいらないというメリットがある。

### Lambda
サーバレスコンピューティングサービスの1つ。利用者はプログラムのコードを用意し、アップロードするだけで自動でコードを実行してくれる。  
Lambdaはコードの実行時間ごとに料金が発生し、実行されていない時間は料金が発生しないためコスト削減につながる。

- [AWS Lambdaの使い方をやさしく解説、関数実行や権限設定の基本を押さえる 連載：やさしく学ぶAWS入門｜ビジネス\+IT](https://www.sbbit.jp/article/cont1/67741)

### IAM (Identity and Access Management)
AWSのサービスで「認証」と「認可」の設定を行うことができるサービス。
IAMでは、以下の機能が用意されている。
- IAMユーザー（グループ）
- IAMポリシー
- IAMロール  
IAMロールとは、ユーザーやグループではなく、EC2などのAWSのサービスや他のアカウントに対してにAWS の操作権限を付与するための仕組み。

### 参考
- 『AWS認定クラウドプラクティショナー直前対策テキスト』- 山内貴弘(著)