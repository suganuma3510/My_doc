# Dockerfile
DockerfileとはDocker上で動作させるコンテナの構成情報をコードで記述されたファイルのこと。
DockerfileをもとにビルドすることでDockerイメージを作成することができる。

- [Dockerfile](#dockerfile)
  - [Dockerfile　書き方](#dockerfile書き方)
    - [Docker イメージ](#docker-イメージ)
  - [Dockerfile のベストプラクティス](#dockerfile-のベストプラクティス)
    - [イメージはできるだけ軽量にする](#イメージはできるだけ軽量にする)
      - [軽量なイメージをベースにする](#軽量なイメージをベースにする)
      - [レイヤの数を最小限に抑える](#レイヤの数を最小限に抑える)
    - [マルチステージビルドを使用する](#マルチステージビルドを使用する)
    - [適したコマンドを使用する](#適したコマンドを使用する)
      - [ADD ではなく、基本的に COPY を使用する](#add-ではなく基本的に-copy-を使用する)
      - [ENTRYPOINT と CMD の違い](#entrypoint-と-cmd-の違い)
    - [参考](#参考)

## Dockerfile　書き方

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

### Docker イメージ
Docker Image はDockerfileによって作成される特定の環境のスナップショット。
イメージを動かしたものがコンテナ。

## Dockerfile のベストプラクティス

### イメージはできるだけ軽量にする
軽量化することで得られるメリット
- イメージの作成と起動が早くなる
- ホストのディスク容量を圧迫しない
- イメージの配布が効率的に行える

#### 軽量なイメージをベースにする
| イメージ名   | サイズ    | 説明                                                                                                |
| ------------ | --------- | --------------------------------------------------------------------------------------------------- |
| scratch      | 0B        | • からっぽのイメージ。libcもshellも⼊ってない。<br/>• OS依存の脆弱性も含まないためセキュア。         |
| busybox      | 1.2MB     | • Linuxのユーティリティをシングルバイナリで提供。<br/>• シングル実⾏バイナリのベースとして使われる。 |
| Alpine Linux | 5.6MB     | • BusyBoxとmuslをベースにした軽量でセキュアなLinuxディストリビューション。                          |
| distroless   | 16.9MB 〜 | • 各種⾔語⽤の実⾏に必要なランタイムだけを持つ。<br/>• Java, Python, Node.js⽤など⾔語ごとのイメージ。   |

#### レイヤの数を最小限に抑える
`RUN`、`COPY`、`ADD`はレイヤを作成する命令であるため、多用するとサイズが大きくなってしまう。

### マルチステージビルドを使用する
ひとつの Dockerfile で複数のビルドができ，各ビルドの段階で必要な部分だけコピーして（残りは破棄される），最終的に使用したいベースイメージにペーストできる機能。

```Dockerfile
# golang をビルド
FROM golang:1.7.3 AS builder
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html  
COPY app.go    .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# 上でビルドしたバイナリだけを Alpine Linux イメージにコピー・起動
FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/alexellis/href-counter/app .
CMD ["./app"]  
```

さらに，イメージからコピーするだけであれば，下記のように簡略化できる。  
例：Nginx のベースイメージ内の nginx.conf だけコピーしてくる

```Dockerfile
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```

### 適したコマンドを使用する
#### ADD ではなく、基本的に COPY を使用する
ADDはローカルファイルのCOPYに加えて、インターネットに公開されているURLからコード取得できる機能がある。  
外部のインターネットにアクセスすると悪意のあるURLからfileを取得する恐れがある。

#### ENTRYPOINT と CMD の違い
どちらもコンテナ起動時に実行されるコマンドを記述するための命令だが、動作の挙動や役割が異なる。  

CMD  
イメージを実行する時、コンテナに対して何もオプションを指定しなければ、自動的に実行するコマンド。  
またCMDはENTRYPOINTの追加引数を指定する役割として使われる。  
CMD命令は1つしか記述できず、複数記述した場合は最後の命令しか処理を行わない。  
実行時に引数を渡して上書きすることが可能。

ENTRYPOINT  
DockerFile実行時に必ず実行したいコマンドを記載する。  
docker runするときに --entrypoint で上書き可能。

使用例：
```Dockerfile
FROM centos:latest
ENTRYPOINT ["ping","-c","3"]
CMD ["1.1.1.1"]
```

上記のようなDockerfileを用意し、`docker run`時に引数として「8.8.8.8」を渡すと、  
CMD命令はコンテナ実行時の引数によって上書きされ、結果として「ping -c 3 8.8.8.8」が実行される。

### 参考
- [Docker に Composer をインストールするベストプラクティス（と解説） \- Qiita](https://qiita.com/yatsbashy/items/02bbbebbfe7e5a5976bc)
- [Dockerfileのベストプラクティス \- Qiita](https://qiita.com/Tsuyozo/items/c706a04848c3fbbaf055)
- [ENTRYPOINTは「必ず実行」、CMDは「（デフォルトの）引数」 \| Pocketstudio\.Net](https://pocketstudio.net/2020/01/31/cmd-and-entrypoint/)
- [Docker CMDとENTRYPOINTの使い方 \| グランドリーム](https://www.grandream.jp/blog/docker-cmd-entrypoint/)