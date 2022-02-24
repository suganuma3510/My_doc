## AWS用語集

- [AWS用語集](#aws用語集)
- [ネットワーキング](#ネットワーキング)
  - [VPC (Virtual Private Cloud)](#vpc-virtual-private-cloud)
    - [VPCフローログ](#vpcフローログ)
    - [VPCエンドポイント](#vpcエンドポイント)
    - [VPCピアリング](#vpcピアリング)
    - [プレイスメントグループ](#プレイスメントグループ)
  - [AWS ENI (Elastic Network Interface)](#aws-eni-elastic-network-interface)
  - [Route 53](#route-53)
  - [AWS Direct Connect](#aws-direct-connect)
  - [AWS IoT Core](#aws-iot-core)
- [コンピュート](#コンピュート)
  - [EC2 (Elastic Compute Cloud)](#ec2-elastic-compute-cloud)
  - [AMI (Amazon Machine Image)](#ami-amazon-machine-image)
  - [ELB (Elastic Load Balancer)](#elb-elastic-load-balancer)
    - [ALB (Application Load Balancer)](#alb-application-load-balancer)
    - [NLB (Network Load Balancer)](#nlb-network-load-balancer)
    - [CLB (Classic Load Balancer)](#clb-classic-load-balancer)
  - [AWS Batch](#aws-batch)
  - [ECS (Elastic Container Service)](#ecs-elastic-container-service)
  - [ECR (Elastic Container Registry)](#ecr-elastic-container-registry)
  - [Fargate](#fargate)
  - [Lambda](#lambda)
  - [Elastic Beanstalk (ビーンズトーク)](#elastic-beanstalk-ビーンズトーク)
- [ストレージおよび配信](#ストレージおよび配信)
  - [EBS (Elastic Block Store)](#ebs-elastic-block-store)
  - [S3 (Simple Storage Service)](#s3-simple-storage-service)
    - [S3 Glacier](#s3-glacier)
    - [オブジェクトストレージ](#オブジェクトストレージ)
  - [Amazon EFS (Amazon Elastic File System)](#amazon-efs-amazon-elastic-file-system)
  - [AWS Storage Gateway](#aws-storage-gateway)
  - [AWS Transfer Family](#aws-transfer-family)
  - [CloudFront](#cloudfront)
- [セキュリティ](#セキュリティ)
  - [ACM (AWS Certificate Manager)](#acm-aws-certificate-manager)
  - [IAM (Identity and Access Management)](#iam-identity-and-access-management)
  - [AWS KMS (Key Management Service)](#aws-kms-key-management-service)
  - [AWS CloudHSM](#aws-cloudhsm)
  - [AWS STS (AWS Security Token Service)](#aws-sts-aws-security-token-service)
  - [AWS WAF (Web Application Firewall)](#aws-waf-web-application-firewall)
  - [AWS Shield](#aws-shield)
  - [Amazon GuardDuty](#amazon-guardduty)
  - [Amazon Inspector](#amazon-inspector)
  - [Amazon Directory Service](#amazon-directory-service)
  - [AWS Organizations](#aws-organizations)
  - [AWS SSO (Single Sign-On)](#aws-sso-single-sign-on)
  - [AWS Arifact](#aws-arifact)
- [管理ツール](#管理ツール)
  - [AWS CloudTrail](#aws-cloudtrail)
  - [AWS Config](#aws-config)
  - [CloudWatch](#cloudwatch)
  - [AWS Application Discovery Service](#aws-application-discovery-service)
  - [Auto Scaling](#auto-scaling)
  - [CloudFormation](#cloudformation)
  - [AWS Service Catalog](#aws-service-catalog)
  - [AWS Trusted Advisor](#aws-trusted-advisor)
  - [AWS OpsWorks](#aws-opsworks)
  - [AWS Systems Manager](#aws-systems-manager)
  - [AWS Secrets Manager](#aws-secrets-manager)
- [データベース](#データベース)
  - [RDS (Relational Database Service)](#rds-relational-database-service)
  - [DynamoDB](#dynamodb)
  - [DynamoDB Accelerator](#dynamodb-accelerator)
  - [Amazon ElastiCache](#amazon-elasticache)
  - [Amazon Neptune](#amazon-neptune)
  - [Redshift](#redshift)
- [アナリティクス](#アナリティクス)
  - [Amazon EMR](#amazon-emr)
  - [Amazon Athena](#amazon-athena)
  - [Amazon Kinesis](#amazon-kinesis)
  - [Amazon CloudSerch](#amazon-cloudserch)
  - [Amazon Elasticserch Service](#amazon-elasticserch-service)
- [アプリケーション統合](#アプリケーション統合)
  - [Amazon SQS (Simple Queue Service)](#amazon-sqs-simple-queue-service)
  - [Amazon MQ](#amazon-mq)
  - [Amazon Managed Streaming for Apache Kafka (MSK)](#amazon-managed-streaming-for-apache-kafka-msk)
  - [AWS AppSync](#aws-appsync)
  - [Amazon EventBridge](#amazon-eventbridge)
  - [Amazon Cognito](#amazon-cognito)
  - [AWS Step Functions](#aws-step-functions)
- [AIサービス](#aiサービス)
  - [Amazon Rekognition](#amazon-rekognition)
  - [Amazon SageMaker](#amazon-sagemaker)
- [移行](#移行)
  - [AWS Database Migration Service （AWS DMS）](#aws-database-migration-service-aws-dms)
  - [AWS Application Migration Service (AWS MGN)](#aws-application-migration-service-aws-mgn)
  - [AWS Schema Conversion Tool （AWS SCT）](#aws-schema-conversion-tool-aws-sct)
  - [AWS Snow ファミリー](#aws-snow-ファミリー)
- [開発者用ツール](#開発者用ツール)
  - [X-Ray](#x-ray)
  - [AWS Cloud Development Kit (CDK)](#aws-cloud-development-kit-cdk)
  - [AWS Serverless Application Model (AWS SAM)](#aws-serverless-application-model-aws-sam)
- [コスト最適化](#コスト最適化)
  - [AWSサポート](#awsサポート)
  - [Amazon WorkSpaces](#amazon-workspaces)
  - [Amazon AppStream](#amazon-appstream)
- [参考](#参考)


<!--------------------------
## ネットワーキング
---------------------------->


## ネットワーキング

### VPC (Virtual Private Cloud)
ユーザー専用の仮想のクラウド環境を構築しプライベートなネットワーク空間を提供するサービス。

#### VPCフローログ
VPCのネットワークインターフェースとの間で行き来するネットワーク上のIPトラフィックに関する情報を、キャプチャできるようにする機能。  
セキュリティグループの診断やトラフィックのモニタリングなどに使用する。  
取得したログはCloudWatchまたはS3に提供される。

#### VPCエンドポイント
サポート対象のAWSサービスなどにVPCをプライベートに接続可能な仮想デバイス。  
セキュリティの問題でインターネットに接続させずにサービスと繋げる際に使用する。

#### VPCピアリング
2つのVPC間でプライベート接続を可能にするネットワーキング機能。
IPv4アドレスまたはIPv6アドレスを使用して2つのVPC間でトラフィックをルーティングすることを可能。

#### プレイスメントグループ
単一のアベイラビリティーゾーン内のインスタンスを論理的にグループ化したもの。  
インスタンス間における低レイテンシな通信を実現するための機能オプション。

<details><summary>参照</summary>

- [EC2 拡張ネットワーキングとプレイスメントグループの効果を試す \| DevelopersIO](https://dev.classmethod.jp/articles/ec2-placement-group/)

</details>

### AWS ENI (Elastic Network Interface)
VPC上で実現する仮想ネットワークインタフェースで、物理的な環境におけるNIC（Network Interface Card）のこと。  
パブリックIPアドレスやプライベートIPアドレス、MACアドレスなどをインスタンスにアタッチ・デタッチすることができる。

### Route 53
可用性と拡張性に優れたクラウドのドメインネームシステム (DNS) ウェブサービス。  
IP アドレスの変換だけでなく、新規ドメイン名の登録やドメインの DNS レコードの管理も行える。

### AWS Direct Connect
オンプレミスのデータセンターやオフィスとAWS間を専用線を介してプライベート接続するサービス。  
これにより、インターネットを介した接続に比べ、安定した良好なネットワーク品質が実現できる。  
利用料はポート使用料とデータ転送料で決まり、インターネット接続よりコストを抑えることができる。

### AWS IoT Core
インターネットに接続されたデバイスから、クラウドアプリケーションやその他のデバイスに簡単かつ安全に通信するためのマネージドクラウドプラットフォーム。

- ルールエンジン  
メッセージブローカーから他のAWSサービスにデータを接続することで、DynamoDBにデータを追加やLambda関数の呼び出しなどができる。

<details><summary>参照</summary>

- [よくある質問 \- AWS IoT Core \| AWS](https://aws.amazon.com/jp/iot-core/faqs/)
- [AWS IoT の仕組み \- AWS IoT Core](https://docs.aws.amazon.com/ja_jp/iot/latest/developerguide/aws-iot-how-it-works.html#aws-iot-core-services)

</details>


<!--------------------------
## コンピュート
---------------------------->


## コンピュート

### EC2 (Elastic Compute Cloud)
仮想サーバを構築できるサービス。LinuxやWindowsなど様々なOSの仮想サーバを立てることができる。  
必要な分だけ仮想サーバーを起動して、セキュリティやネットワーキングの設定、ストレージの管理をすることができる。  
また、EC2では要件が変更した場合や需要が増加した場合なども、必要に応じて迅速に容量のスケールアップやスケールダウンをすることができる。  
インスタンスの種類が数多くあり、用途に応じて選択することができる。

### AMI (Amazon Machine Image)
EC2インスタンスでソフトウェアを動かすために必要なOSやボリューム、APサーバー、アプリケーションなどを合わせたテンプレート。  
インスタンス起動時に必ず指定する必要がある。

### ELB (Elastic Load Balancer)
アプリケーションのトラフィック(一定時間内におけるインターネット通信量のこと)の負荷に応じて分散する仕組み。  
EC2インスタンスやコンテナ、IPアドレス、Lambda関数などをターゲットに負荷分散を行うことができる。主に以下の3種類がある。

#### ALB (Application Load Balancer)
HTTPやHTTPSなどのWeb サービスに発生するトラフィックの負荷分散を行う。

#### NLB (Network Load Balancer)
数百万リクエストという極めて高いパフォーマンスが要求されるTCP、UDPおよびTLSにおけるトラフィックの負荷分散を行う。

#### CLB (Classic Load Balancer)
EC2-Classicネットワーク内で構築されたアプリケーションを対象とした負荷分散を行う。

### AWS Batch  
バッチ処理を行うためのマネージドサービス。  
膨大な量のコンピューティングリソースを、コンテナ型のアプリケーション実行基盤上で並列実行するための仕組みを提供する。  
主に大規模な科学計算やシミュレーションに使用される。

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

<details><summary>参照</summary>

- [Amazon ECS タスク定義 \- Amazon Elastic Container Service](https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/task_definitions.html)
- [チュートリアル: AWS CLI を使用した Fargate タスクのクラスターの作成 \- Amazon Elastic Container Service](https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ECS_AWSCLI_Fargate.html)
- [Amazon ECS task execution IAM role \- Amazon Elastic Container Service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)

</details>

### ECR (Elastic Container Registry)
Docker コンテナイメージを簡単に保存、管理、デプロイできる完全マネージド型のコンテナレジストリ。

### Fargate
AWS が提供するマネージドなコンテナ実行環境。  
コンテナを実行するサーバーを直接意識する必要がなく、サーバーのインスタンスタイプの選択やクラスタ管理がいらないというメリットがある。

### Lambda
サーバレスコンピューティングサービスの1つ。利用者はプログラムのコードを用意し、アップロードするだけで自動でコードを実行してくれる。  
Lambdaは割り当てられたメモリとコードの実行時間ごとに料金が発生し、実行されていない時間は料金が発生しないためコスト削減につながる。

<details><summary>参照</summary>

- [AWS Lambdaの使い方をやさしく解説、関数実行や権限設定の基本を押さえる 連載：やさしく学ぶAWS入門｜ビジネス\+IT](https://www.sbbit.jp/article/cont1/67741)

</details>

### Elastic Beanstalk (ビーンズトーク)
Webアプリケーションのデプロイおよびスケーリングを行うサービス。  
ユーザーはコードをアップロードするだけで、キャパシティのプロビジョニング、ロードバランシング、Auto Scalingからアプリケーションのヘルスモニタリングまで、デプロイを自動的に処理する。


<!--------------------------
## ストレージおよび配信
---------------------------->


## ストレージおよび配信

### EBS (Elastic Block Store)
EC2インスタンスにアタッチして使用するためのブロックストレージ。  
EBSはデータに素早く、かつ長期永続性が必要な場合に推奨される。  
スナップショットを作成することもでき、バックアップはS3に保管される。  
高い可用性や大規模なワークロードにも対応している。  
なお1つのEC2から複数のEBSには接続できるが、その逆はできない。  
また、AZを超えた接続もできない。

<details><summary>参照</summary>

- [よく聞くEBSってなに？ \- Qiita](https://qiita.com/miyuki_samitani/items/20a1d74657668578180b)

</details>

### S3 (Simple Storage Service)
スケーラビリティ、可用性、セキュリティ、パフォーマンスを高いレベルで実現するオブジェクトストレージサービス。  
世界中で利用されており、Webアプリやバックアップ、静的ファイルの配信、IoTデバイスやビッグデータ分析など様々な用途で活用されている。  
耐久性は99.999999999%（イレブンナイン）、可用性は年間99.99%。  

#### S3 Glacier
データのアーカイブ(複数のファイルやフォルダを1つにまとめること)や長期のバックアップを目的としたサービス。  
S3との違いとして、保管したデータの取り出しに時間がかかるが、価格が安価であることが特徴。  
また高い安全性と耐久性に優れており、ほとんど取り出す機会がないデータやダウンロードに時間が掛かってもいいデータなどに使用される。  
1ファイル40TBまで保存可能。

#### オブジェクトストレージ
データを「オブジェクト」という単位で扱う記憶装置。  
ディレクトリ構造で管理するファイルストレージとは異なり、データサイズやデータ数の保存制限がないため、大容量データの保存に適している。  
オブジェクトにはストレージシステムのなかで固有のID（URI）が付与され、このIDでデータを出し入れする。

<details><summary>参照</summary>

- [AWSの S3って何？ 初心者でも分かる簡単用語解説 \| WafCharm（ワフチャーム） \- AIによるAWS / Azure WAFのルール自動運用サービス](https://www.wafcharm.com/blog/s3-for-beginners/)
- [5分で絶対に分かるオブジェクトストレージ：5分で絶対に分かる（3/5 ページ） \- ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1705/29/news014_3.html)
- [オブジェクトストレージとは : 富士通](https://www.fujitsu.com/jp/products/computing/storage/lib-f/tech/beginner/object-storage/)
- [Amazon S3とAmazon Glacier両者の違いとは？ – Amazon Web Service\(AWS\)導入開発支援](https://www.acrovision.jp/service/aws/?p=1646)

</details>

### Amazon EFS (Amazon Elastic File System)
ストレージをプロビジョニングまたは管理することなくファイルデータを共有できるファイルストレージサービス。  
ペタバイト単位まで自動的にスケールされ、耐久性は99.999999999%（イレブンナイン）、さらに複数のAZに冗長的に保存される。  
DropboxのAWS版。

### AWS Storage Gateway
主にオンプレミス環境のデータを仮想アプライアンス経由でS3にバックアップするためのサービス。
- ボリュームゲートウェイ  
iSCSIProtocolを使用してブロックストレージを提供し、AWS上にストレージを拡張することができる。
  - キャッシュ型モード  
プライマリデータはS3に保存され、**頻繁にアクセスするデータ**はキャッシュでローカルに保持される。  
データを全てS3に保存して、よく使うデータのみローカルでキャッシュしておくイメージ。またストレージの拡張を最小限に抑える。
  - 保管型モード  
プライマリデータはローカルに保存され、**データセット全体**が低レイテンシーにアクセス可能になる。非同期にAWSにバックアップされる。  
ローカルにデータを残したままAWSにバックアップするイメージ。
- ファイルゲートウェイ  
業界標準のファイルプロトコル（NFS、SMBなど）を使用し、ファイルをオブジェクトとしてS3に保存、アクセスするためのファイルインターフェースを提供している。  

### AWS Transfer Family
フルマネージド型のファイル転送サービス。  
SFTP、FTPS、FTP経由でAmazon S3またはAmazon EFSと直接ファイル転送ができる。  
また、ワークフローの移行が容易であり、顧客とのデータ共有方法を変更せずにS3などにデータを保存できる。

<details><summary>参照</summary>

- [AWS Transfer Family のよくある質問 \| アマゾン ウェブ サービス](https://aws.amazon.com/jp/aws-transfer-family/faqs/)
- [AWSのFTPとは？AWS Transfer Familyの特徴やメリットを紹介！ \| FEnet AWSコラム](https://www.fenet.jp/aws/column/aws-beginner/804/)

</details>

### CloudFront
AWSが提供しているコンテンツ配信ネットワーク(CDN)サービス。  

<details><summary>参照</summary>

- [Amazon CloudFront とは何ですか? \- Amazon CloudFront](https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)

</details>


<!--------------------------
## セキュリティ
---------------------------->


## セキュリティ

### ACM (AWS Certificate Manager)
AWS が提供している SSL 証明書とキーの作成、保存、更新が行えるサービス。  
リージョン単位で発行する事ができる。

### IAM (Identity and Access Management)
AWSリソースへのアクセスを安全に管理するために「認証」と「認可」の仕組みを提供するサービス。  
AWSのユーザーやグループを作成及び管理することができ、ポリシーに従ったアクセス権を付与することができる。  
- IAMユーザー（グループ）  
AWSで作成するエンティティ(ユーザーまたはアプリケーションの実体)であり、名前と認証情報で構成される。  
- IAMロール  
IAMロールとは、ユーザーやグループではなく、EC2などのAWSのサービスや他のアカウントに対してにAWS の操作権限を付与するための仕組み。
- IAMポリシー  
アクセス許可のポリシーを定義し、プリンシパルエンティティ（IAMユーザー、IAMグループ、IAMロール）に関連付けることができる。  
ポリシーには以下のような種類がある。
  - 管理ポリシー  
  複数のプリンシパルエンティティに適用させることができる。
    - AWS管理ポリシー  
    AWSによって用意されているポリシー。  
    各AWSサービスごとにフル権限や読み取り権限など大まかな権限が用意されている。
    - カスタマー管理ポリシー  
    ユーザーが作成できるポリシー。  
    特定のS3に対してのみ権限を付与したいなど細かい権限を付与したい場合に使用する。
  - インラインポリシー  
  プリンシパルエンティティと1対1の関係で適用できる。  
  プリンシパルエンティティごとに変更する必要があるため、意図しない変更を防ぐことができる。
  - アイデンティティベース (ユーザーベース、ID)  
  誰がどのリソースに対してどんなアクションを実行できるかを指定する。  
  ユーザー、グループ、ロールに直接アタッチして使用する。
  - リソースベース  
  このリソースに対して誰がどんなアクションを実行できるかを指定する。  
  リソースに対して直接アタッチする。

<details><summary>参照</summary>

- [IAM とは \- AWS Identity and Access Management](https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/introduction.html)
- [AWSのポリシーを使いこなそう　ポリシー設計につまづかないためのポイントを整理 \| そるでぶろぐ](https://devlog.arksystems.co.jp/2020/03/12/9338/#)
- [\[AWS\]管理ポリシーとインラインポリシーの違いが分からなかったので改めてIAMポリシーのお勉強をする \- Qiita](https://qiita.com/Batchi/items/a2dde3d2df27568cc078)

</details>

### AWS KMS (Key Management Service)
データを暗号化するためのキーを作成および管理することができるサービス。  
通信の暗号化とファイルやデータベースなどの保管データの暗号化の2つがある。  
AWS CloudTrail でログを調査してキーの使用を監査することが可能。

- CMK（Customer Master Key）  
必ず作成するキー。AWSから作成する方法とユーザーが用意した鍵をCMKとしてインポートする方法がある。
- CDK（Customer Data Key）  
データの暗号化に使用する。CDKは作成時にCMKによって暗号化されて生成させる。
- キーマテリアル  
CMK作成時に使用するデータのこと。KMSではキーマテリアルオリジンとして、デフォルトでKMS、その他に外部（EXTERNAL）、カスタムキーストア（CloudHSM）を指定することができる。

<details><summary>参照</summary>

- [【AWS】Key Management Service（その②用語） \- 自由気ままに書いちゃおう](https://www.guri2o1667.work/entry/2021/08/24/%E3%80%90AWS%E3%80%91Key_Management_Service%EF%BC%88%E3%81%9D%E3%81%AE%E2%91%A1%E7%94%A8%E8%AA%9E%EF%BC%89)

</details>

### AWS CloudHSM
クラウドベースのマネージド型ハードウェアセキュリティモジュール。
暗号化キーを簡単に生成することができ、専用のハードウェアで暗号化キーを保管するため、キーの耐久性と可用性が高い。  
KMSと比べより安全にキーを管理することが可能だが、高価。  

<details><summary>参照</summary>

- [【AWS SAP】AWS KMS と CloudHSMの違い【頻出】 \- Qiita](https://qiita.com/ayumi_imai/items/6a74c6327e0f6a1ac7db)

</details>

### AWS STS (AWS Security Token Service)
AWSリソースへアクセスするための一時的なセキュリティ認証情報を提供するためのサービス。  
ユーザーに対してAWS IDを定義せずにAWSリソースへのアクセスを許可できるため、IDフェデレーションが可能になる。

### AWS WAF (Web Application Firewall)
可用性、セキュリティ侵害、リソースの過剰消費に影響を与えるような、ウェブの脆弱性を利用した一般的な攻撃やボットから、ウェブアプリケーションまたはAPIを保護する。

### AWS Shield
DDoS攻撃（分散型サービス妨害）に対するAWSの保護サービス。  
アプリケーションのダウンタイムとレイテンシーを最小限に抑えるための各種機能を備えており、エッジロケーションでの利用も可能。  
無料版と有料版がある。

### Amazon GuardDuty
マネージド型の脅威検出サービス。  
悪意のある動作や不正な動作を継続的にモニタリング可能。

### Amazon Inspector
アプリケーションのセキュリティを評価できるサービス。  
事前定義されたルールによってチェックを行い、セキュリティ上の脆弱性やベストプラクティスからの逸脱の確認が可能。  
完全に評価するにはエージェントをインストールする必要がある。

### Amazon Directory Service
AWS上でMicrosoftのActive Directoryが使用できるサービス。  

### AWS Organizations
複数のAWSアカウントを統合するためのアカウント管理サービス。

### AWS SSO (Single Sign-On)
シングルサインオン（SSO：Single Sign On）とは、1度のユーザー認証によって複数のシステム（業務アプリケーションやクラウドサービスなど）の利用が可能になる仕組みのこと。  
SSOを実現するマネージドサービスであり、Organizationsとサービス統合されているため、複数アカウント間のSSOを容易に実現することができる。

### AWS Arifact
AWSはコンプライアンスプログラム（法規範、社内規範、倫理規範の3要素を企業及び全従業員が遵守するための枠組み）として独立した監査人による業界認証等を取得している。  
AWS ArifactはAWSが取得しているセキュリティおよびコンプライアンスのレポートと特定のオンライン契約をオンデマンドで取得可能なサービス。

<details><summary>参照</summary>

- [コンプライアンスプログラムへの具体的な取り組み方](https://blog.tripwire.co.jp/blog/detail-action)

</details>


<!--------------------------
## 管理ツール
---------------------------->


## 管理ツール

### AWS CloudTrail
AWSアカウントの監査ができるサービス。  
マネジメントコンソールを使用して実行されるアクションの履歴などを取得可能。

### AWS Config
AWSリソースに対してどんな変更をしたか、時系列で変更履歴を追跡できるサービス。  
コンプライアンスに違反しているリソースの特定も可能。  
サードパーティー製品のリソースもサポートしている。

### CloudWatch
システムやアプリケーションの監視と管理ができるサービス。  
ログデータやパフォーマンスデータを統合的に収集し、確認することができ、メトリクス(パフォーマンスに関する)データは15ヵ月間保持される。  
システム環境名における異常検知、アラーム設定、ログとメトリクスを元にした表示、自動化されたアクションの実行、問題のトラブルシューティング等を行うことができる。  

CloudWatch Eventsとして、例えばメトリックを元に何らかのインシデントのアラートをAWS Lambdaでの自動化のアクションのルールを起動させることが可能。  
つまりAWSリソースの状態変化に対応する、システムの自動化に利用できる。

CloudWatch Logsでは、ログを特定のフィールドを基準にクエリ処理やソートしてグループ化できる。  
またクエリ言語を使用したカスタム計算の作成や、ダッシュボードでのログデータの可視化も可能。

### AWS Application Discovery Service
オンプレミス環境など、AWSとは別環境で稼働しているサーバ（物理/仮想問わない）のホスト名、IP アドレス、MAC アドレス、CPU 割り当て、ネットワークスループット、メモリ割り当て、ディスクリソース割り当て、DNS サーバーといった静的設定内容およびCPU 使用率やメモリ使用率といったリソース使用率のメトリクスを含むさまざまなデータを収集することができる。  
主に収集したデータを元にAWSに移行する場合の必要スペック（インスタンスタイプ等）を設計し、移行計画を立てるために利用する。

<details><summary>参照</summary>

- [よくある質問 \- AWS Application Discovery Service \| AWS](https://aws.amazon.com/jp/application-discovery/faqs/#Discovered_data)
- [【初心者】AWS Application Discovery Service を使ってみる \- Qiita](https://qiita.com/mksamba/items/cb4797763eba25e53ec7)

</details>

### Auto Scaling
自動的にリソースをスケールさせることができるサービス。  
また異常なインスタンスを置き換え、アプリケーションの可用性を維持できる。  
フリート管理を使用して、フリートの状態と可用性の維持が可能。  
動的スケーリングと予測スケーリング機能があり、動的は需要の変更に対応してEC2インスタンスを増減し、予測は需要の予測に応じて、適切な数のEC2インスタンスを自動的にスケジュールする。

- EC2 Auto Scaling  
  ユーザーが定義した条件に応じてEC2インスタンスを自動的に追加または削除できる
- Application Auto Scaling  
  ECSクラスタ、スポットフリート、EMRクラスタ、DynamoDBテーブル、Auroraレプリカなどに対応

### CloudFormation
インフラの設定をプログラムコードで行えるサービス。  
ほぼあらゆるAWSリソースのプロビジョニングと管理をJSONまたはYAMLベースで行うことができる。

### AWS Service Catalog
その企業のCloudFrontのテンプレートをまとめたもの。  
これによりユーザーは社内で承認されたITサービスのみデプロイすることが可能になる。

### AWS Trusted Advisor
AWSのベストプラクティスに従ったチェックができるオンラインツール。  
コスト最適化、パフォーマンス、セキュリティ、フォルトトレランス（耐障害性）、サービス制限のそれぞれでチェックする。

### AWS OpsWorks
Chef（シェフ）やPuppet（パペット）といったサーバーの設定や構築、管理を自動化するインフラ構成管理ツールを使用し、コードでサーバーの構成を自動化できるサービス。  
CloudFormationとの違いとしては、サポート範囲が異なり、EC2 インスタンス、EBS ボリューム、Elastic IP、CloudWatch メトリクスなど、アプリケーション志向の AWS リソースに限られている。

### AWS Systems Manager
主にEC2インスタンスやオンプレミス環境のサーバー群の運用管理を容易にするための多種多様なサービスを提供している。

### AWS Secrets Manager
AWS内リソース、オンプレミス環境、またはサードパーティアプリケーションにアクセスするための各種機密情報の管理を、簡単にするAWSのマネージドサービス。  


<details><summary>参照</summary>

- [AWS Secrets Managerとは? \- AWS Secrets Manager](https://docs.aws.amazon.com/ja_jp/secretsmanager/latest/userguide/intro.html)
- [機密情報を一元管理できる「AWS Secrets Manager」とは？概要と主要機能、動作原理、各種リソースまとめ \| DevelopersIO](https://dev.classmethod.jp/articles/about-secrets-manager/)

</details>


<!--------------------------
## データベース
---------------------------->


## データベース

### RDS (Relational Database Service)
クラウド上で提供されるリレーショナル型データベースサービス。  
サーバーのプロビジョニング、OSの導入、データベースの設定、バッチ適用、バックアップ等の作業を自動化することができる。  

### DynamoDB
NoSQLの完全マネージド型データベースサービス。  
NoSQLのため処理速度が速く、1日10兆件以上のリクエストや、毎秒2000万件を超えるリクエストをサポート可能。  
また耐久性が高く、セキュリティ、バックアップおよびリカバリー機能が組み込まれている。  
複数のリージョンでバックアップを行うことで高い可用性を実現しており、無制限のスケーラビリティを提供している。  
稼働時間による課金はされず、主にストレージ容量とリクエスト量で課金される。

<details><summary>参照</summary>

- [Amazon DynamoDB（マネージド NoSQL データベース）\| AWS](https://aws.amazon.com/jp/dynamodb/)

</details>

### DynamoDB Accelerator
DynamoDB用に特化したフルマネージド型のインメモリキャッシュサービス。  
DynamoDBの前に配置することで、1ミリ秒未満のレイテンシーが実現可能。

### Amazon ElastiCache
セットアップ、運用や拡張が簡単にできるマネージド型インメモリキャッシュサービス。  
RedisとMemcachedの二種類のエンジンを選択することができる。  
RDSなどのデータベースの前に配置し、高スループットかつ低レイテンシーにデータを取得することができる。

### Amazon Neptune
マネージド型のグラフデータベースサービス。  
グラフとはノードと呼ばれる対象物を起点として、このノード間をエッジと呼ばれる関係性で表現したデータモデル。  
例：SNSのユーザー（ノード）同士のフォローによる繋がり（エッジ）  
　　→この繋がりを探索することで、まだ繋がっていないユーザー同士の新たな繋がりをアプリ側で提案できる

### Redshift
ペタバイト規模のマネージド型クラウド上のデータウェアハウス。  
Redshift Spectrumを利用することで、S3上の非構造化データに対してクエリを実行できる。  
オンプレミスと異なり、数クリックで起動、従量課金制という特徴がある。  
また高パフォーマンスであり、容量のニーズの変化に応じてノードの数や種類の変更が可能。


<!--------------------------
## アナリティクス
---------------------------->


## アナリティクス

### Amazon EMR
Apache Spark、Apache Hive、Presto などのオープンソースフレームワークを使用して、ビッグデータの処理、分析、機械学習を行なうことができるサービス。
大規模なデータの分散処理を行うため多数のEC2インスタンスを使用する。  
1秒ごとに課金されるため、インスタンス数を経やすいことでパフォーマンスが向上する。

### Amazon Athena  
S3内のデータに対して標準SQLクエリを実行し、データ分析を行うことができるサービス。  
サーバーレスかつ、実行したクエリに対して飲み料金が発生するため、Redshiftよりコスト効率が高い。

### Amazon Kinesis
ストリーミングデータをリアルタイムで収集、処理、分析することができる完全マネージド型サービス。  
毎秒ギガバイトのデータを継続してキャプチャすることができる。リアルタイムで取り込めるデータは以下の通り。
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
KPL（Kinesis Producer Library）を使用してデータをプッシュすることができる。
デフォルトでは24時間のみデータを保存し、最大7日間まで保存することができる。
- Kinesis Data Firehose  
ストリームデータを受け取り、S3やRedshift、Elasticserchなどに配信することができるサービス。
- Kinesis Data Analytics  
SQLやApache Finkでストリームデータをリアルタイムで分析できるサービス。

### Amazon CloudSerch
マネージド型の検索機能サービス。  
検索キーワードが、どの文書に含まれているかを簡単に管理できる。
これによりアプリケーション側の検索機能の実装や運用口数を減らすことができる。

### Amazon Elasticserch Service
Elastic社が提供しているオープンソースの全文検索エンジンのマネージド型サービス。
全文検索に加え、リアルタイムデータ分析、ログ解析などが可能。


<!--------------------------
## アプリケーション統合
---------------------------->


## アプリケーション統合

### Amazon SQS (Simple Queue Service)
サーバーレスでキューイングを実現できるフルマネージドキューイングサービス。  
キューイングとは処理の順番待ちのことで、システム間でデータを送受信する際に一時的にデータをため込む場所を設け、非同期に処理を行うことができる仕組みのこと。  
MQと比べシンプルな機能かつスケーラビリティに優れている。

キュータイプ
- 標準キュー  
スループットは無制限だが、配信順序は保証されない。  
メッセージは複数回配信される可能性がある。
- FIFOキュー  
先入先出。スループットは1秒当たり300件。  
配信順序を保証し、必ず1回のみ配信する。

### Amazon MQ
Apache ActiveMQ向けのマネージド型メッセージブローカーサービス。  
オンプレミスからクラウド内のメッセージブローカーへの移行が容易にでき、多くの一般的なメッセージブローカーとの互換性がある。

<details><summary>参照</summary>

- [Amazon MQ とは \- Amazon MQ](https://docs.aws.amazon.com/ja_jp/amazon-mq/latest/developer-guide/welcome.html)
- [Amazon MQ とは？ \- Qiita](https://qiita.com/miyuki_samitani/items/5c59bf4270181699395f)

</details>

### Amazon Managed Streaming for Apache Kafka (MSK)
フルマネージドのApache Kafkaを提供する。  
Kafkaとはスケーラビリティと処理性能に優れた分散メッセージキューのことで、データをリアルタイムに処理するストリーミングアプリケーションに向いている。

<details><summary>参照</summary>

- [特徴 \- Amazon MSK \| AWS](https://aws.amazon.com/jp/msk/features/)
- [Amazon MSKとは？データを高速に中継し分析する \| SKYARCHのITあんちょこ](https://www.skyarch.net/column/amazon-managed-streaming-for-apache-kafka/)

</details>

### AWS AppSync
GraphQL APIの開発を容易にする、完全マネージド型サービス。  
AWS DynamoDBやLambda、その他のデータソースとの安全な接続に必要な、面倒な作業を自動的に処理することができる。  
また、数百万のクライアントに対しWebsocketsを介して、データの更新をリアルタイムでプッシュできる。

<details><summary>参照</summary>

- [AWS AppSync（アプリデータをリアルタイムで保存、同期）\| AWS](https://aws.amazon.com/jp/appsync/)

</details>

### Amazon EventBridge 
CloudWatch Eventsをベースに構築され、イベントを通じて様々なアプリケーション同士を簡単に接続できるようにするサーバーレスのサービス。  

<details><summary>参照</summary>

- [Amazon EventBridge とは \- Amazon EventBridge](https://docs.aws.amazon.com/ja_jp/eventbridge/latest/userguide/eb-what-is.html)
- [【徹底解説】Amazon EventBridgeとは？ \| SunnyCloud](https://www.sunnycloud.jp/column/20210802-01-2/)

</details>

### Amazon Cognito
モバイルやWebアプリケーションにユーザーのサインアップと認証機能を素早く簡単に追加することができる。

### AWS Step Functions
AWS Lambda 関数およびその他のビジネスクリティカルなアプリケーションを構築するための AWS のサービスを組み合わせることができるサーバーレスオーケストレーションサービス。  
素早くアプリケーションをビルドおよび更新ができる。

<details><summary>参照</summary>

- [AWS Step Functions とは? \- AWS Step Functions](https://docs.aws.amazon.com/ja_jp/step-functions/latest/dg/welcome.html)

</details>


<!--------------------------
## AIサービス
---------------------------->


## AIサービス

### Amazon Rekognition
画像およびどうかを認識するサービス。  
あらかじめ学習済みの顔や物体、テキストなどを検出するモデルを提供しており、AIによる画像認識などが実現できる。

### Amazon SageMaker
機械学習モデルを高速に開発、学習、デプロイするためのモジュールが用意されているフルマネージド型サービス。  
Jupyter Notebook（ジュピターノートブック）をインターフェイスとしてインスタンス作成、モデル構築、トレーニング、デプロイまでのフローを実施することが可能。  
Jupyter Notebookとはデータ分析を行うことが出来る対話型ブラウザ実行環境のこと。


<details><summary>参照</summary>

- [Amazon SageMakerとは何なのか、使い方について。 – Amazon Web Service\(AWS\)導入開発支援](https://www.acrovision.jp/service/aws/?p=1237)

</details>


<!--------------------------
## 移行
---------------------------->


## 移行

### AWS Database Migration Service （AWS DMS）
データベースをAWSに移行するためのマネージド型サービス。  
リレーショナルデータベース、データウェアハウス、NoSQL データベース、他の種類のデータストアを移行することができる。

<details><summary>参照</summary>

- [AWS Database Migration Service（AWS DMS）を使ったデータ移行（前編） – エンタープライズIT \[COLUMNS\]](https://ent.iij.ad.jp/articles/2499/)

</details>

### AWS Application Migration Service (AWS MGN)
変更を加えることなく、最小限のダウンタイムで、アプリケーションをクラウドに移行することが出来る。  
ソースサーバーを物理インフラストラクチャ、仮想インフラストラクチャ、およびクラウドインフラストラクチャからAWSでネイティブに実行するように自動的に変換することにより、時間のかかる、エラーが発生しやすい手動プロセスを最小限に抑え、以降を簡素化できる。

<details><summary>参照</summary>

- [リフトアンドシフト \- AWS Application Migration Service](https://aws.amazon.com/jp/application-migration-service/?nc1=h_ls)

</details>

### AWS Schema Conversion Tool （AWS SCT）
既存のデータベーススキーマを、別のデータベースエンジンのスキーマに変換するツール。  
リレーショナルOLTPスキーマやデータウェアハウススキーマを変換可能。

<details><summary>参照</summary>

- [[AWS Schema Conversion Tool とは \- AWS Schema Conversion Tool](https://docs.aws.amazon.com/ja_jp/SchemaConversionTool/latest/userguide/CHAP_Welcome.html)

</details>

### AWS Snow ファミリー
AWSへのデータ移行やエッジコンピューティングのための物理的デバイス。  
非常に容量の多いデータの移行などに使用され、SnowballというアタッシュケースのようなものやSnowmobileというトラックのものもある。  

 - AWS Snowball Edge：テラバイト規模
 - AWS Snowball：ペタバイト規模
 - AWS Snowmobile：エクサバイト規模


<!--------------------------
## 開発者用ツール
---------------------------->


## 開発者用ツール

### X-Ray
マイクロサービスアプリケーションのサービス間の依存関係を分かりやすく可視化し、詳細なトレースデータを提供するアプリケーション分析ツール。  
マイクロサービスでは、コンポーネント間のボトルネックが見えないため、パフォーマンス分析が難しい面があり、それらを解決するために使用される。

### AWS Cloud Development Kit (CDK)
プログラミング言語を使用してクラウドアプリケーションリソースを定義するためのオープンソースのソフトウェア開発フレームワーク。
また、AWS Codeシリーズと組み合わせて使用することも可能。

<details><summary>参照</summary>

- [AWS クラウド開発キット – アマゾン ウェブ サービス](https://aws.amazon.com/jp/cdk/)

</details>

### AWS Serverless Application Model (AWS SAM)
サーバーレスアプリケーション構築用のオープンソースフレームワーク。  


<details><summary>参照</summary>

- [AWS Serverless Application Model \(AWS SAM\) とは \- AWS Serverless Application Model](https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/what-is-sam.html)

</details>


<!--------------------------
## コスト最適化
---------------------------->


## コスト最適化

### AWSサポート
AWSによる技術サポートサービス。料金に応じてサポートを受けることができる。  
上から順に料金が安くなっている。

- Basic Support  
  全ての利用者が利用可能。基本的なガイド等が提供される。
- Developer Support  
  AWS Trusted Advisorの7コアチェックや営業時間内のメールによる技術サポートなどが受けられる。
- Business Support  
  本番システムのワークロードに適したサポート。AWS Trusted Advisorのフルチェック、電話、Eメール、チャットアクセスが24時間、週7日提供され、本番システムにサービスの中断が発生した場合の応答時間は1時間未満。
- Enterprise Support  
  非常に重要なワークロードに適したサポート。電話、Eメール、チャットアクセスが24時間、週7日提供され、本番システムにサービスの中断が発生した場合の応答時間は15分未満。

<details><summary>参照</summary>

- [サポートのプラン比較 \| 開発者、ビジネス、エンタープライズ \| AWS サポート](https://aws.amazon.com/jp/premiumsupport/plans/)

</details>

### Amazon WorkSpaces
マネージド型の仮想デスクトップサービス。

### Amazon AppStream
完全マネージド型のアプリケーションストリーミングサービス。  
アプリケーションの配信(Workspacesを特定アプリにだけアクセスできるよう制限したような形で利用)できるサービス

<details><summary>参照</summary>

- [Amazon AppStream 2\.0（デスクトップアプリをブラウザへ安全に配信）\| AWS](https://aws.amazon.com/jp/appstream2/)
- [Amazon AppStream 2\.0 のお試し構築・設定 \- Qiita](https://qiita.com/u-bayashi/items/316c32068d421e4647bb)

</details>


<!--------------------------
## 参考
---------------------------->


## 参考
- [AWS Documentation](https://docs.aws.amazon.com/index.html)
- [AWS の製品・サービス一覧 \| クラウドなら AWS](https://aws.amazon.com/jp/products/?aws-products-all.sort-by=item.additionalFields.productNameLowercase&aws-products-all.sort-order=asc&awsf.re%3AInvent=*all&awsf.Free%20Tier=*all&awsf.tech-category=*all)
- 『AWS認定クラウドプラクティショナー直前対策テキスト』- 山内貴弘(著)
- 『AWS認定ソリューションアーキテクト－プロフェッショナル～試験特性から導き出した演習問題と詳細解説～』