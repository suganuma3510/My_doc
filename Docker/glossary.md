- [Dockerfile　書き方](#dockerfile書き方)
- [Dockerイメージ](#dockerイメージ)
- [Docker Compose](#docker-compose)
  - [version](#version)
  - [services](#services)
  - [IMAGE](#image)
  - [build](#build)
  - [volumes](#volumes)
  - [ports](#ports)
  - [environment](#environment)
  - [env_file](#env_file)
  - [command](#command)

#### Dockerfile　書き方

|     句     | 説明                                                                                                      |
| :--------: | :-------------------------------------------------------------------------------------------------------- |
|    FROM    | ベース（親）画像を指定します。                                                                            |
|   LABEL    | メタデータを提供します。 メンテナ情報を含めるのに良い場所です。                                           |
|    ENV     | 永続的な環境変数を設定します。                                                                            |
|    RUN     | コマンドを実行してイメージレイヤを作成します。 パッケージをコンテナにインストールするために使用されます。 |
|    COPY    | ファイルとディレクトリをコンテナにコピーします。                                                          |
|    ADD     | ファイルとディレクトリをコンテナにコピーします。 ローカルの.tarファイルをアンパックできます。             |
|    CMD     | 実行中のコンテナにコマンドと引数を提供します。 パラメータは上書きできます。 CMDは1つだけです。            |
|  WORKDIR   | あとに続く説明の作業ディレクトリを設定します。                                                            |
|    ARG     | ビルド時にDockerに渡す変数を定義します。                                                                  |
| ENTRYPOINT | 実行中のコンテナにコマンドと引数を提供します。 引数は存続します。                                         |
|   EXPOSE   | ポートを公開します。                                                                                      |
|   VOLUME   | 永続データにアクセスして保存するためのディレクトリマウントポイントを作成します。                          |


RUN - イメージ作成時に実行される
CMD - コンテナ実行時に実行される

#### Dockerイメージ
Docker Image はDockerfileによって作成される特定の環境のスナップショット。
イメージを動かしたものがコンテナ。

#### Docker Compose

[docker-compose - 入門 Docker](https://y-ohgi.com/introduction-docker/3_production/docker-compose/)

```yml
version: '3.7'

services:
  nginx:
    build:
      context: .
      dockerfile: docker/nginx/Dockerfile
    volumes:
      - ./public:/var/www/html/public:ro
    ports:
      - 8080:80
    environment:
      PHP_HOST: app

  app:
    build:
      context: .
      dockerfile: Dockerfile
    env_file:
      - .env.example
    # volumes:
    #   - .:/var/www/html:cached

  mysql:
    image: mysql:5.7
    volumes:
      - ./mysql:/var/lib/mysql:delegated
    command: mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci
    environment:
      MYSQL_ALLOW_EMPTY_PASSWORD: 'yes'
    ports:
      - 13306:3306
```

##### version
docker-composeのバージョンを指定します。
特にこだわりがなければ最新のものを記述するようにしましょう。
```yml
version: '3.7'
```

##### services
起動するコンテナの定義を行います。
このdocker-compose.yamlでは nginx , app , mysql の3つが定義されています。
```yml
services:
  nginx:
```

##### IMAGE
コンテナを起動するDocker Image を指定します。
```yml
image: mysql:5.7
```

##### build
docker buildの実行情報を記述します。
ここで定義された情報を元にDockerをビルドし、そのビルドしたイメージ使用してコンテナを起動します。
image もしくは build どちらかを記述する必要があります。
コマンドの場合、 docker build -f docker/nginx/Dockerfile . と同一です。
```yml
build:
　# docker-compose.ymlから見た、プロジェクトのルートディレクトリへの相対パス
  context: .
　# contextで設定したディレクトリから見た、実行対象のDockerfileへの相対パス
  dockerfile: docker/nginx/Dockerfile
```

##### volumes
ボリュームのマウントを行います。 コマンドの場合、 -v $(pwd)/public:/var/www/html/public:ro `<IMAGE ID>` オプションと同一です。
```yml
volumes:
  - ./public:/var/www/html/public:ro
```

##### ports
ポートの開放を行います。
左にホストのポートを、右にコンテナのポートを指定します。
コマンドの場合、 -p 8080:80 オプションと同一です。
```yml
ports:
  - 8080:80
```

##### environment
起動するコンテナへ環境変数を定義します。
コマンドの場合、 -e PHP_HOST=app オプションと同一です。
```yml
environment:
  PHP_HOST: app
```

##### env_file
ファイルに定義された環境変数を読み取り、コンテナへ定義します。
```yml
env_file:
  - .env.example
```

##### command
Dockerfileで定義されている CMD の上書きを行います。
```yml
command: mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci
```
