# module
resourceのまとめを定義しておくテンプレートのようなもの。  
Moduleに必要な値を与えることで環境を構築することができる。  
さらにModuleは再利用できるので、環境の複製にとても便利だったり、  
パーツを組み合わせるようにModuleを使って様々なパターンの環境を作れる。

## moduleの使い方

親モジュール（使われる側）
```
variable "vpc_cidr_block" {} // 空の変数
variable "vpc_name" {}

resource "aws_vpc" "this" {
 cidr_block           = var.vpc_cidr_block // 使う側で値を代入
 instance_tenancy     = "default"
 enable_dns_hostnames = true

 tags = {
  Name = "${var.vpc_name}-vpc"
 }
}
```

子モジュール（使う側）
```
module "vpc_hoge" {
 source         = "./modules/VPC" // ディレクトリ指定
 vpc_cidr_block = "10.0.0.0/16"   // 使われる側で定義している変数
 vpc_name       = "hogehoge"
}
```

tfvarsを使う場合
```
module "base" {
  region  = var.region
  db_user = var.db_user
  db_pass = var.db_pass
  source  = "./modules"
}
```

上記のように書くことで、`modules`フォルダでも使えるようになる。  
`modules`のソースを指定。`terraform.tfvars`で設定した`db_user`, `db_pass`をdb定義用のテンプレートファイルに渡す。

ファイル構造（modules構成）の例
```
├─modules
│ ├─alb.tf
│ ├─ecs.tf
│ ├─iam_role.tf
│ ├─iam_user.tf
│ ├─subnet.tf
│ ├─output.tf
│ └─xxx.tf
└─providers
    ├─main.tf
    └─terraform.tfvars
```