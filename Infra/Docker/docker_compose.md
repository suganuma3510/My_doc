- [docker-compose](#docker-compose)
  - [docker-compose.yamlサンプル](#docker-composeyamlサンプル)
  - [version](#version)
  - [services](#services)
  - [image](#image)
  - [build](#build)
  - [volumes](#volumes)
    - [short syntaxとlong syntaxの違い](#short-syntaxとlong-syntaxの違い)
    - [トップレベルの volumes](#トップレベルの-volumes)
  - [ports](#ports)
  - [environment](#environment)
  - [env\_file](#env_file)
  - [command](#command)
  - [Docker コンテナ内からホストのポートにアクセス](#docker-コンテナ内からホストのポートにアクセス)
  - [参考](#参考)

## docker-compose
docker-composeはローカルでDockerのオーケストレーションを行うためのツール。  
DockerのビルドからNetworkやVolumeの管理をコードベースで定義して行う。  
複数のコンテナを管理する際に使用される。

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

docker-composeのバージョンを指定する。  
特にこだわりがなければ最新のものを記述する。

### services

起動するコンテナの定義を行う。  
サンプルのdocker-compose.yamlでは `nginx` , `app` , `mysql` の3つが定義されている。

### image

コンテナを起動するDocker Image を指定する。

### build

docker buildの実行情報を記述する。  
ここで定義された情報を元にDockerをビルドし、そのビルドしたイメージ使用してコンテナを起動する。  
`image` もしくは `build` どちらかを記述する必要がある。

コマンドの場合、 `docker build -f docker/nginx/Dockerfile .` と同一。

```yml
build:
  context: .
  dockerfile: docker/nginx/Dockerfile
```

### volumes

ボリュームのマウントを行う。ホストとコンテナのディレクトリを共有することができる。  
 コマンドの場合、 `-v $(pwd)/public:/var/www/html/public:ro <IMAGE ID>` オプションと同一。

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

#### トップレベルの volumes
トップレベル(一番上の階層)にvolumesを名前付きで定義することによって、  
複数のコンテナ間でディレクトリを共有することができる。

### ports

ポートの開放を行います。  
左にホストのポートを、右にコンテナのポートを指定する。  
コマンドの場合、 `-p 8080:80` オプションと同一。

### environment

起動するコンテナへ環境変数を定義する。  
コマンドの場合、 `-e PHP_HOST=app` オプションと同一。

```yml
environment:
  PHP_HOST: app
```

### env_file

ファイルに定義された環境変数を読み取り、コンテナへ定義する。

### command

Dockerfileで定義されている `CMD` の上書きを行う。

`command: mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci` 

### Docker コンテナ内からホストのポートにアクセス

Docker for Mac / Windows の場合は、`host.docker.internal` がホストを指すものとしてデフォルトで提供されている
```
environment:
  WEB_URL: 'http://host.docker.internal:8080'
```

### 参考
- [docker-compose - 入門 Docker](https://y-ohgi.com/introduction-docker/3_production/docker-compose/)
- [docker\-compose の bind mount を1行で書くな](https://zenn.dev/sarisia/articles/0c1db052d09921)