## CircleCIとは
Saas型のCI/CDサービス。Saas型とであるという点が特徴。CircleCIはクラウド上のコンテナあるいはVMを実行環境として使用する。

### 自動テストの仕組み
1. githubのプッシュ時に、config.ymlを読み込む
2. CircleCIのサーバーにDockerコンテナが起動して、imageをコピー
3. テストを行うコマンドを実行する

### 設定ファイルの書き方
config.yml
```yml
version: 2

jobs:
    # build ジョブ: CircleCI 上で Docker コンテナを作成してテストする
    build:
        docker:
            - image: alpine
        steps:
            - checkout
            - run:
                name: Echo Test
                command: echo "CircleCI Test"
    # deploy ジョブ: EC2 に SSH 接続して、デプロイを実行する
    deploy:
        machine:
            image: circleci/classic:edge
        steps:
            - checkout
            # CircleCI に登録した秘密鍵を呼び出す
            - add_ssh_keys:
            # CircleCI に登録した環境変数を使って SSH
            - run: ssh ${USER_NAME}@${HOST_NAME} 'cd [あなたのプロジェクトへのパス] && git pull'

workflows:
    version: 2
    # build_and_deploy ジョブ: 一番最初に呼ばれるジョブ
    build_and_deploy:
        # build ジョブと deploy ジョブを呼び出す
        jobs:
            - build
            - deploy:
                requires:
                    # deploy ジョブより先に build ジョブを実行しろ、という命令
                    - build
                # master ブランチに push された場合のみ deploy ジョブを実行する
                filters:
                    branches:
                        only: master
```

#### 処理の流れ
1. GitHub の master ブランチに push されたら CircleCI サーバ上で config.yml が読み込まれる
2. 最初に workflows ブロック内の build_and_deploy ジョブを実行する
3. build_and_deploy ジョブは「小さいジョブの実行」を定義しています
   - jobs ブロック内に定義した build ジョブを実行する
   - jobs ブロック内に定義した deploy ジョブを実行する