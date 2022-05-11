- [aws-cli コマンド](#aws-cli-コマンド)
  - [デフォルトではない、プロファイルでコマンドを実行](#デフォルトではないプロファイルでコマンドを実行)
  - [初期設定](#初期設定)
  - [プロファイル確認](#プロファイル確認)
  - [プロファイル切り替え](#プロファイル切り替え)

### aws-cli コマンド
#### デフォルトではない、プロファイルでコマンドを実行
```
aws [command] --profile [profileName]
```

#### 初期設定
```
$ aws configure --profile [name]
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-1
Default output format [None]: json
```

#### プロファイル確認
```
aws configure list
```

#### プロファイル切り替え

```
export AWS_DEFAULT_PROFILE=[name]
```