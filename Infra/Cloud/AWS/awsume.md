# AWSume
AWS 認証情報の管理プロセスを簡素化し、さまざまな AWS アカウントとロールをよりシームレスに切り替えることができるOSSのコマンドラインツール。
AWSが出しているツールではない。

公式：https://awsu.me/

## セットアップ
https://awsu.me/general/quickstart.html

1. awsume をインストール
```
brew install pipx
pipx install awsume
```

2. PATHを追加
```
pipx ensurepath
```

3. エイリアスを設定
```
alias awsume=". awsume"
```

4. (任意)AWSコンソールを開くプラグインをインストール
```
pipx inject awsume awsume-console-plugin
```

5. AWS CLIの初期設定
```
% aws configure
AWS Access Key ID [None]: [アクセスキー]
AWS Secret Access Key [None]: [シークレットアクセスキー]
Default region name [None]: ap-northeast-1
Default output format [None]: json　←お好みで
```

6. スイッチ先のプロファイルを登録
```
% vim ~/.aws/config
```

configファイルの例
```
[default]
region = ap-northeast-1
output = json

[profile service-01-prd]
role_arn = arn:aws:iam::111111111111:role/readonly
source_profile = default
mfa_serial = [MFAデバイスARN]

[profile service-01-stg]
role_arn = arn:aws:iam::222222222222:role/power
source_profile = default
mfa_serial = [MFAデバイスARN]

[profile service-01-dev]
role_arn = arn:aws:iam::000000000000:role/admin
source_profile = default
mfa_serial = [MFAデバイスARN]
```


7. プロファイルの一覧を表示
```
% awsume -l
Listing...

===============================AWS Profiles===============================
PROFILE         TYPE  SOURCE   MFA?  REGION          PARTITION  ACCOUNT     
service-01-dev  Role  default  Yes   None            aws        000000000000
service-01-prd  Role  default  Yes   None            aws        111111111111
service-01-stg  Role  default  Yes   None            aws        222222222222
default         User  None     No    ap-northeast-1  ?          Unavailable 
```

8. awsumeコマンドでスイッチロール
```
% awsume service-01-dev
Session token will expire at 2024-09-28 01:37:39
[service-01-dev] Role credentials will expire 2024-09-27 18:44:10
```

9. スイッチ先アカウントに切り替わったか確認
```
% aws sts get-caller-identity --query Account
"000000000000"　←アカウントIDがスイッチ先のアカウントIDになっていること！
```

## Tips
コマンドの使用方法
https://awsu.me/general/usage.html

- プロファイル一覧を表示
```
awsume -l
```

- スイッチロールする
```
awsume <profile_name>
```

- マネジメントコンソールを起動
```
awsume <profile_name> -c
```
