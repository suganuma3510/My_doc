## AWS用語集

- [AWS用語集](#aws用語集)
  - [VPC (Virtual Private Cloud)](#vpc-virtual-private-cloud)
  - [EC2 (Elastic Compute Cloud)](#ec2-elastic-compute-cloud)
  - [EBS (Elastic Block Store)](#ebs-elastic-block-store)
  - [S3 (Simple Storage Service)](#s3-simple-storage-service)
    - [S3 Glacier](#s3-glacier)
    - [オブジェクトストレージ](#オブジェクトストレージ)
  - [Route 53](#route-53)
  - [ACM (AWS Certificate Manager)](#acm-aws-certificate-manager)
  - [IAM (Identity and Access Management)](#iam-identity-and-access-management)
  - [KMS (Key Management Service)](#kms-key-management-service)
  - [AWS WAF (Web Application Firewall)](#aws-waf-web-application-firewall)
  - [ELB (Elastic Load Balancer)](#elb-elastic-load-balancer)
    - [ALB (Application Load Balancer)](#alb-application-load-balancer)
    - [NLB (Network Load Balancer)](#nlb-network-load-balancer)
    - [CLB (Classic Load Balancer)](#clb-classic-load-balancer)
  - [Auto Scaling](#auto-scaling)
  - [CloudFront](#cloudfront)
  - [CloudFormation](#cloudformation)
  - [CloudWatch](#cloudwatch)
  - [VPCフローログ](#vpcフローログ)
  - [RDS (Relational Database Service)](#rds-relational-database-service)
  - [DynamoDB](#dynamodb)
  - [ECS (Elastic Container Service)](#ecs-elastic-container-service)
  - [ECR (Elastic Container Registry)](#ecr-elastic-container-registry)
  - [Fargate](#fargate)
  - [Lambda](#lambda)
  - [AMI (Amazon Machine Image)](#ami-amazon-machine-image)
  - [Elastic Beanstalk](#elastic-beanstalk)
  - [X-Ray](#x-ray)
  - [参考](#参考)

### VPC (Virtual Private Cloud)
ユーザー専用の仮想のクラウド環境を構築しプライベートなネットワーク空間を提供するサービス。

### EC2 (Elastic Compute Cloud)
仮想サーバを構築できるサービス。LinuxやWindowsなど様々なOSの仮想サーバを立てることができる。  
必要な分だけ仮想サーバーを起動して、セキュリティやネットワーキングの設定、ストレージの管理をすることができる。  
また、EC2では要件が変更した場合や需要が増加した場合なども、必要に応じて迅速に容量のスケールアップやスケールダウンをすることができる。  
インスタンスの種類が数多くあり、用途に応じて選択することができる。

### EBS (Elastic Block Store)
EC2インスタンスにアタッチして使用するためのブロックストレージ。  
高い可用性や大規模なワークロードにも対応している。  
なお1つのEC2から複数のEBSには接続できるが、その逆はできない。  
また、AZを超えた接続もできない。

- [よく聞くEBSってなに？ \- Qiita](https://qiita.com/miyuki_samitani/items/20a1d74657668578180b)

### S3 (Simple Storage Service)
スケーラビリティ、可用性、セキュリティ、パフォーマンスを高いレベルで実現するオブジェクトストレージサービス。  
世界中で利用されており、Webアプリやバックアップ、静的ファイルの配信、IoTデバイスやビッグデータ分析など様々な用途で活用されている。

#### S3 Glacier
データのアーカイブ(複数のファイルやフォルダを1つにまとめること)や長期のバックアップを目的としたサービス。  
S3との違いとして、保管したデータの取り出しに時間がかかるが、価格が安価であることが特徴。  
また高い安全性と耐久性に優れており、ほとんど取り出す機会がないデータやダウンロードに時間が掛かってもいいデータなどに使用される。

#### オブジェクトストレージ
データを「オブジェクト」という単位で扱う記憶装置。  
ディレクトリ構造で管理するファイルストレージとは異なり、データサイズやデータ数の保存制限がないため、大容量データの保存に適している。  
オブジェクトにはストレージシステムのなかで固有のID（URI）が付与され、このIDでデータを出し入れする。

- [AWSの S3って何？ 初心者でも分かる簡単用語解説 \| WafCharm（ワフチャーム） \- AIによるAWS / Azure WAFのルール自動運用サービス](https://www.wafcharm.com/blog/s3-for-beginners/)
- [5分で絶対に分かるオブジェクトストレージ：5分で絶対に分かる（3/5 ページ） \- ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1705/29/news014_3.html)
- [オブジェクトストレージとは : 富士通](https://www.fujitsu.com/jp/products/computing/storage/lib-f/tech/beginner/object-storage/)
- [Amazon S3とAmazon Glacier両者の違いとは？ – Amazon Web Service\(AWS\)導入開発支援](https://www.acrovision.jp/service/aws/?p=1646)

### Route 53
可用性と拡張性に優れたクラウドのドメインネームシステム (DNS) ウェブサービス。  
IP アドレスの変換だけでなく、新規ドメイン名の登録やドメインの DNS レコードの管理も行える。

### ACM (AWS Certificate Manager)
AWS が提供している SSL 証明書とキーの作成、保存、更新が行えるサービス。

### IAM (Identity and Access Management)
AWSリソースへのアクセスを安全に管理するために「認証」と「認可」の仕組みを提供するサービス。  
AWSのユーザーやグループを作成及び管理することができ、ポリシーに従ったアクセス権を付与することができる。  
IAMでは、以下の機能が用意されている。
- IAMユーザー（グループ）  
  AWSで作成するエンティティ(ユーザーまたはアプリケーションの実体)であり、名前と認証情報で構成される。  
  アクセス許可の管理と追跡ができるように、個別のIAMユーザを作成することがベストプラクティス。  
  またアクセスキーの共有はしてはならない。
- IAMロール  
IAMロールとは、ユーザーやグループではなく、EC2などのAWSのサービスや他のアカウントに対してにAWS の操作権限を付与するための仕組み。
- IAMポリシー  
  アクセス許可のポリシーを定義し、AWSリソースに関連付けることができる。

- [IAM とは \- AWS Identity and Access Management](https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/introduction.html)

### KMS (Key Management Service)
データを暗号化するためのキーを作成および管理することができるサービス。  
通信の暗号化とファイルやデータベースなどの保管データの暗号化の2つがある。

### AWS WAF (Web Application Firewall)
可用性、セキュリティ侵害、リソースの過剰消費に影響を与えるような、ウェブの脆弱性を利用した一般的な攻撃やボットから、ウェブアプリケーションまたはAPIを保護する。

### ELB (Elastic Load Balancer)
アプリケーションのトラフィック(一定時間内におけるインターネット通信量のこと)の負荷に応じて分散する仕組み。  
EC2インスタンスやコンテナ、IPアドレス、Lambda関数などをターゲットに負荷分散を行うことができる。主に以下の3種類がある。

#### ALB (Application Load Balancer)
HTTPやHTTPSなどのWeb サービスに発生するトラフィックの負荷分散を行う。

#### NLB (Network Load Balancer)
数百万リクエストという極めて高いパフォーマンスが要求されるTCP、UDPおよびTLSにおけるトラフィックの負荷分散を行う。

#### CLB (Classic Load Balancer)
EC2-Classicネットワーク内で構築されたアプリケーションを対象とした負荷分散を行う。

### Auto Scaling
Auto Scalingにはいくつかのサービスがあり、例としてEC2 Auto Scalingはユーザーが定義した条件に応じてEC2インスタンスを自動的に追加または削除できる。  
フリート管理を使用して、フリートの状態と可用性を維持できる。また、動的スケーリングと予測スケーリング機能があり、動的は需要の変更に対応してEC2インスタンスを増減し、予測は需要の予測に応じて、適切な数のEC2インスタンスを自動的にスケジュールする。

### CloudFront
AWSが提供しているコンテンツ配信ネットワーク(CDN)サービス。  

- [Amazon CloudFront とは何ですか? \- Amazon CloudFront](https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)

### CloudFormation
インフラの設定をプログラムコードで行えるサービス。  
作成するAWSリソースはJSONまたはYAMLを使用し定義することができる。

### CloudWatch
システムやアプリケーションの監視と管理ができるサービス。  
ログデータやパフォーマンスデータを統合的に収集し、確認することができる。  
システム環境名における異常検知、アラーム設定、ログとメトリクスを元にした表示、自動化されたアクションの実行、問題のトラブルシューティング等を行うことができる。

### VPCフローログ
VPCのネットワークインターフェースとの間で行き来するネットワーク上のIPトラフィックに関する情報を、キャプチャできるようにする機能。  
セキュリティグループの診断やトラフィックのモニタリングなどに使用する。  
取得したログはCloudWatchまたはS3に提供される。

### RDS (Relational Database Service)
クラウド上で提供されるリレーショナル型データベースサービス。  
サーバーのプロビジョニング、OSの導入、データベースの設定、バッチ適用、バックアップ等の作業を自動化することができる。  

### DynamoDB
NoSQLの完全マネージド型データベースサービス。  
NoSQLのため処理速度が速く、1日10兆件以上のリクエストや、毎秒2000万件を超えるリクエストをサポート可能。  
また耐久性が高く、セキュリティ、バックアップおよびリカバリー機能が組み込まれている。  
複数のリージョンでバックアップを行うことで高い可用性を実現している。

- [Amazon DynamoDB（マネージド NoSQL データベース）\| AWS](https://aws.amazon.com/jp/dynamodb/)

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

### AMI (Amazon Machine Image)
EC2インスタンスでソフトウェアを動かすために必要なOSやボリューム、APサーバー、アプリケーションなどを合わせたテンプレート。  
インスタンス起動時に必ず指定する必要がある。

### Elastic Beanstalk
Webアプリケーションのデプロイおよびスケーリングを行うサービス。  
ユーザーはコードをアップロードするだけで、キャパシティのプロビジョニング、ロードバランシング、Auto Scalingからアプリケーションのヘルスモニタリングまで、デプロイを自動的に処理する。

### X-Ray
マイクロサービスアプリケーションのサービス間の依存関係を分かりやすく可視化し、詳細なトレースデータを提供するアプリケーション分析ツール。  
マイクロサービスでは、コンポーネント間のボトルネックが見えないため、パフォーマンス分析が難しい面があり、それらを解決するために使用される。

### 参考
- [AWS Documentation](https://docs.aws.amazon.com/index.html)
- 『AWS認定クラウドプラクティショナー直前対策テキスト』- 山内貴弘(著)