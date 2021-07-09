# docker-compose

- [docker-compose](#docker-compose)
  - [概要](#概要)
    - [docker-compose.yamlサンプル](#docker-composeyamlサンプル)
    - [version](#version)
    - [services](#services)
    - [image](#image)
    - [build](#build)
    - [volumes](#volumes)
      - [short syntaxとlong syntaxの違い](#short-syntaxとlong-syntaxの違い)
    - [ports](#ports)
    - [environment](#environment)
    - [env\_file](#env_file)
    - [command](#command)
    - [参考](#参考)

## 概要

docker-composeはローカルでDockerのオーケストレーションを行うためのツールです。  
DockerのビルドからNetworkやVolumeの管理をコードベースで定義して行ってくれます。  
単純なnginxの起動であれば素のdockerコマンドで問題ありませんが、ここにPHP, MySQL...とコンテナが増えていくとその威力を発揮します。

### docker-compose.yamlサンプル

Nginx、PHP、MySQLを構築するためのサンプル

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

### version

docker-composeのバージョンを指定します。  
特にこだわりがなければ最新のものを記述するようにしましょう。

### services

起動するコンテナの定義を行います。  
このdocker-compose.yamlでは `nginx` , `app` , `mysql` の3つが定義されています。

### image

コンテナを起動するDocker Image を指定します。

### build

docker buildの実行情報を記述します。  
ここで定義された情報を元にDockerをビルドし、そのビルドしたイメージ使用してコンテナを起動します。  
`image` もしくは `build` どちらかを記述する必要があります。

コマンドの場合、 `docker build -f docker/nginx/Dockerfile .` と同一です。

```yml
build:
  context: .
  dockerfile: docker/nginx/Dockerfile
```

### volumes

ボリュームのマウントを行います。 コマンドの場合、 `-v $(pwd)/public:/var/www/html/public:ro <IMAGE ID>` オプションと同一です。

short syntax
```yml
volumes:
  - ./public:/var/www/html/public
```

long syntax
```yml
volumes:
  - type: bind
    source: ./public
    target: /var/www/html/public
```

#### short syntaxとlong syntaxの違い
short syntaxは、もしホストに対象ファイルが存在しなかった場合、代わりにディレクトリを作成する。

long syntaxは、マウント対象がホスト上に存在しない場合, docker-compose up 時に適切なエラーを吐き, 早期発見を促す。

### ports

ポートの開放を行います。  
左にホストのポートを、右にコンテナのポートを指定します。  
コマンドの場合、 `-p 8080:80` オプションと同一です。

### environment

起動するコンテナへ環境変数を定義します。  
コマンドの場合、 `-e PHP_HOST=app` オプションと同一です。

```yml
environment:
  PHP_HOST: app
```

### env\_file

ファイルに定義された環境変数を読み取り、コンテナへ定義します。

### command

Dockerfileで定義されている `CMD` の上書きを行います。

`command: mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci` 

### 参考
- [docker-compose - 入門 Docker](https://y-ohgi.com/introduction-docker/3_production/docker-compose/)
- [docker\-compose の bind mount を1行で書くな](https://zenn.dev/sarisia/articles/0c1db052d09921)