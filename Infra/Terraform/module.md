# module
resourceのまとめを定義しておくテンプレートのようなもの。  
Moduleに必要な値を与えることで環境を構築することができる。  
さらにModuleは再利用できるので、環境の複製にとても便利だったり、  
パーツを組み合わせるようにModuleを使って様々なパターンの環境を作れる。

## moduleの使い方

親モジュール（使われる側）
```tf
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
```tf
module "vpc_hoge" {
 source         = "./modules/VPC" // ディレクトリ指定
 vpc_cidr_block = "10.0.0.0/16"   // 使われる側で定義している変数
 vpc_name       = "hogehoge"
}
```

tfvarsを使う場合
```tf
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

## module間の値のやりとり
EC2を立てたい場合、VPC IDやサブネットIDを指定する必要があるため、それらの値を参照しなければならない。  
`output`を宣言することで、他の`module`でもリソースの情報を参照することができる。

### outputの使い方
```tf
# output [変数名] { value = [格納したいリソース情報] }
output "vpc_id" { value = aws_vpc.vpc.id }
```

```tf
# オプション
# description：概要
# sensitive：CLIへ出力しない（機密情報をマスクする際に使用）
output "vpc_id" { 
  value = aws_vpc.vpc.id 
  description = "VPC IDの説明"
  sensitive   = true
}
```

参照される側
```tf
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "pub-sub" {
  count = length(var.pub_cidrs)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.pub_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pub-${element(var.azs, count.index)}"
  }
}

output "vpc_id" { value = aws_vpc.vpc.id }
output "pub_subnet_ids" { value = aws_subnet.pub-sub.*.id }
```

参照する側
```tf
module "network" {
  source = "./module/network"

  name      = var.name
  vpc_cidr  = var.vpc_cidr
  azs       = var.azs
  pub_cidrs = var.public_subnet_cidrs
  pri_cidrs = var.private_subnet_cidrs
}

module "ec2" {
  source = "./module/ec2"

  app_name       = var.name
  vpc_id         = module.network.vpc_id
  pub_subnet_ids = module.network.pub_subnet_ids
}
```

## 参照
- [出力値\-構成言語\| HashiCorpによるTerraform](https://www.terraform.io/language/values/outputs)
- [\[Terraform\]Module間の値の受け渡しについて \| DevelopersIO](https://dev.classmethod.jp/articles/terraform_module_coordination/)