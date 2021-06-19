- [コンテナ作成＆起動](#コンテナ作成起動)
- [コンテナ停止＆削除](#コンテナ停止削除)
- [ビルド](#ビルド)
- [コンテナでコマンド実行](#コンテナでコマンド実行)
- [upしたコンテナに入る](#upしたコンテナに入る)
- [イメージをもとにコンテナを作成](#イメージをもとにコンテナを作成)
- [Dockerfileをもとにイメージ作成](#dockerfileをもとにイメージ作成)
- [ポートマップ](#ポートマップ)
- [権限付与](#権限付与)
- [コンテナ、イメージ削除](#コンテナイメージ削除)
- [volume削除](#volume削除)
  - [すべて削除](#すべて削除)
  - [リンク切れ削除](#リンク切れ削除)
- [docker-composeダウンロード](#docker-composeダウンロード)
- [ファイル容量確認](#ファイル容量確認)
- [ECS](#ecs)
- [build時に環境変数を渡す](#build時に環境変数を渡す)
- [コンテナのファイルをホストにコピー](#コンテナのファイルをホストにコピー)
- [コンテナ表示](#コンテナ表示)
- [コンテナ停止](#コンテナ停止)
- [参考](#参考)

#### コンテナ作成＆起動
```
docker-compose up
```

指定したサービスのみ起動
```
docker-compose up ＜サービス名＞
docker-compose up nginx
```

バッググラウンドで実行
```
docker-compose up -d
```

#### コンテナ停止＆削除
```
docker-compose down
```

#### ビルド
```
docker-compose build
```

buildと同時にup
```
docker-compose up -d --build
```

#### コンテナでコマンド実行

すでにあるコンテナでコマンド実行
```
docker-compose exec ＜サービス名＞ ＜実行したいコマンド＞
docker-compose exec mysql echo 'hello'
```

コンテナを新たに作成してコマンドを実行
```
docker-compose run ＜サービス名＞ ＜実行したいコマンド＞
docker-compose run mysql echo 'hello'

# --rm 実行後コンテナを削除
docker-compose run --rm mysql echo 'hello'
```

#### upしたコンテナに入る
```
docker-compose exec ＜サービス名＞ sh
# または
docker-compose exec ＜サービス名＞ bash

docker-compose exec db sh
# または
docker-compose exec db bash
```

#### イメージをもとにコンテナを作成
```
docker run nginx
```

#### Dockerfileをもとにイメージ作成
```
docker build <ビルドコンテキスト>
```
```
docker build
```

#### ポートマップ
```
docker run -p <ホストポート:コンテナポート> nginx
```
```
docker run -p 80:80 nginx
```
```
docker run --rm -p 80:80 homeres-nuxt-app
```

#### 権限付与
```
sudo chmod 777
```
```
sudo yum -y install ImageMagick ImageMagick-devel
```

#### コンテナ、イメージ削除
```
docker container prune
```
```
docker image prune
```
```
docker rmi 6782816 -f
```

#### volume削除
##### すべて削除
```
docker volume rm $(docker volume ls -qf dangling=true)
```

##### リンク切れ削除
```
docker volume ls -qf dangling=true | xargs -r docker volume rm
```

#### docker-composeダウンロード
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

#### ファイル容量確認
```
df -h
du -h | sort -rh | head -5
```

#### ECS
```
sudo usermod -a -G docker ec2-user
aws ecr get-login --no-include-email --region ap-northeast-1
```

#### build時に環境変数を渡す
```
FROM alpine
ARG my_app_version
ENV VERSION_APP=$my_app_version
```
```
$ hoge='fuga'
$ docker build --tag my_alpine --build-arg my_app_version=$hoge .

docker build -t homeres-nuxt-app -f docker/production/nuxt/Dockerfile .
```

#### コンテナのファイルをホストにコピー
```
docker cp [コンテナID]:[コピーしたいファイルパス] [ローカルにコピーしたいパス]
```
```
docker cp 8be7a6fe6734:/magenta-data/lookback_rnn/generated magenta
```

#### コンテナ表示
```
docker ps -a
```
```
docker container ls
```

#### コンテナ停止
```
docker stop [コンテナID]
```
```
docker stop
```

#### 参考
[docker-compose コマンドまとめ](https://qiita.com/wasanx25/items/d47caf37b79e855af95f)

