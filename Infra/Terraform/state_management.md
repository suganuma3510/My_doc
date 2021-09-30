## State管理

### Stateファイルはローカルで管理しない
ローカルで管理すると、PCが壊れてインフラ管理が出来なくなる、また状態管理ファイルを紛失したりするリスクがある。  
TerraformではStateファイルは保存場所を明示的に指定しないとローカル保存になる。

### Stateファイルをロックする
Stateの状態をロックしない場合  
同時にapply等をするとリソースやStateファイルにズレが発生してしまう。  
→CI/CDツールのみで実行、かつ並列動作なしなどの制御が必要

Stateの状態をロックした場合  
Terraform実行中は他の人がTerraformを実行できなくなるため、予期せぬリソースの削除を防ぐことができる。

#### リモートで管理するメリット
- 状態を保存と状態のロックができるため、状態の破損を防ぐことができる
- 複数人で同じ状態を共有できる

### 実装例

State Lock なし
- 個人開発やPoC向け
```tf
terraform {
  backend "s3" {
    bucket = "devday2021-bucket"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
```

State Lock あり
- チーム開発や本番環境向け
```tf
terraform {
  backend "s3" {
    bucket         = "devday2021-bucket"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "TerraformLockState"
  }
}
```

### 参考
- [Backend Type: s3 \- Terraform by HashiCorp](https://www.terraform.io/docs/language/settings/backends/s3.html)
- [Terraformのstateをリモートで管理する \- Qiita](https://qiita.com/Kento75/items/9686945d37a37282ce00)
- [「それ、どこに出しても恥ずかしくないTerraformコードになってるか？」 / Terraform AWS Best Practices \- Speaker Deck](https://speakerdeck.com/yuukiyo/terraform-aws-best-practices?slide=16)