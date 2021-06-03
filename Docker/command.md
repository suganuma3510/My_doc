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

#### buildと同時にup
```
docker-compose up -d --build
```
```
docker-compose build
```

#### upしたコンテナに入る
```
docker-compose exec app sh
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