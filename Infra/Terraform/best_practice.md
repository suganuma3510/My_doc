## Terraform ベストプラクティス

- [Terraform ベストプラクティス](#terraform-ベストプラクティス)
- [`count`、`for_each`の適した使用方法](#countfor_eachの適した使用方法)
- [State管理](#state管理)
  - [Stateファイルはローカルで管理しない](#stateファイルはローカルで管理しない)
  - [Stateファイルをロックする](#stateファイルをロックする)
    - [リモートで管理するメリット](#リモートで管理するメリット)
  - [実装例](#実装例)

## `count`、`for_each`の適した使用方法
- 同じモジュールまたはリソースブロックで`count`と`for_each`は同時に使用できない
- `for_each`を使用する場合、マップのキーは既知の値である必要があり、機密値を引数として使用することはできない
- インスタンスがほぼ同じである場合は、`count`が適している
- 一部の引数で、カウント整数から導出できない個別の値が必要な場合は、`for_each`を使用する

<details><summary>参照</summary>

- [The count Meta\-Argument \- Configuration Language \| Terraform by HashiCorp](https://www.terraform.io/language/meta-arguments/count)
- [Terraformカウントとそれぞれの比較：どちらを使用しますか？ \| ジェフブラウンテック](https://jeffbrown.tech/terraform-count-foreach/)

</details>

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

<details><summary>参照</summary>

- [Backend Type: s3 \- Terraform by HashiCorp](https://www.terraform.io/docs/language/settings/backends/s3.html)
- [Terraformのstateをリモートで管理する \- Qiita](https://qiita.com/Kento75/items/9686945d37a37282ce00)
- [「それ、どこに出しても恥ずかしくないTerraformコードになってるか？」 / Terraform AWS Best Practices \- Speaker Deck](https://speakerdeck.com/yuukiyo/terraform-aws-best-practices?slide=16)

</details>