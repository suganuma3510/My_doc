# AWS用語集

- [AWS用語集](#aws用語集)
    - [AWS](#aws)
    - [VPC (Virtual Private Cloud)](#vpc-virtual-private-cloud)
    - [Route 53](#route-53)
    - [ACM (AWS Certificate Manager)](#acm-aws-certificate-manager)
    - [ALB (Application Load Balancer)](#alb-application-load-balancer)
    - [RDB (Relational Database Service)](#rdb-relational-database-service)
    - [ECS (Elastic Container Service)](#ecs-elastic-container-service)
    - [ECR (Elastic Container Registry)](#ecr-elastic-container-registry)
    - [Fargate](#fargate)

### AWS
Amazon により提供されているクラウドプラットフォーム。  
インターネットを介して 100 以上のサーバー・ストレージ・データベース・ソフトウェアといったコンピューターを使用した様々なサービスを利用することができる。

### VPC (Virtual Private Cloud)
ユーザー専用の仮想のクラウド環境を構築しプライベートなネットワーク空間を提供するサービス。

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
EC2 インスタンスを用いて仮想サーバー構築によく用いられる Docker コンテナを簡単に実行、停止、管理できる非常にスケーラブルで高速な管理サービス。

### ECR (Elastic Container Registry)
Docker コンテナイメージを簡単に保存、管理、デプロイできる完全マネージド型のコンテナレジストリ。

### Fargate
AWS が提供するマネージドなコンテナ実行環境。  
コンテナを実行するサーバーを直接意識する必要がなく、サーバーのインスタンスタイプの選択やクラスタ管理がいらないというメリットがある。