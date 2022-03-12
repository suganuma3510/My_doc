- [初期化](#初期化)
- [フォーマット](#フォーマット)
- [エラーチェック](#エラーチェック)
- [構成をチェック](#構成をチェック)
- [実行、再作成](#実行再作成)
- [状態を確認](#状態を確認)
- [module取り込み](#module取り込み)
- [削除](#削除)
- [tfenvインストール](#tfenvインストール)
- [インストールしているバージョン一覧表示](#インストールしているバージョン一覧表示)
- [インストール可能なバージョン一覧表示](#インストール可能なバージョン一覧表示)
- [バージョンを指定してインストール](#バージョンを指定してインストール)
- [特定のバージョンに切り替え](#特定のバージョンに切り替え)

#### 初期化
```
terraform init
```

#### フォーマット
```
terraform fmt
```

まとめてフォーマット
```
terraform fmt -recursive
```

#### エラーチェック
```
terraform validate
```

#### 構成をチェック
```
terraform plan
```

#### 実行、再作成
```
terraform apply
```

#### 状態を確認
```
terraform show
```

#### module取り込み
```
terraform get
```

```
terraform init
```

module更新
```
terraform get -update
```

#### 削除
```
terraform destroy
```

#### tfenvインストール
```
brew install tfenv
```

#### インストールしているバージョン一覧表示
```
tfenv list
```

#### インストール可能なバージョン一覧表示
```
tfenv list-remote
```

#### バージョンを指定してインストール
```
tfenv install 1.0.11
```

#### 特定のバージョンに切り替え
```
tfenv use 1.0.11
```