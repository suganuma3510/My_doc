# Dockerfile

### Dockerfile　書き方

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

### マルチステージビルド
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

### 参考
[Docker に Composer をインストールするベストプラクティス（と解説） \- Qiita](https://qiita.com/yatsbashy/items/02bbbebbfe7e5a5976bc)