## Kubernetes

- [Kubernetes](#kubernetes)
  - [ECSとの違い](#ecsとの違い)
  - [Pod](#pod)
  - [Control Plane](#control-plane)
    - [API Server](#api-server)
    - [Scheduler](#scheduler)
    - [Controller Manager](#controller-manager)
    - [etcd](#etcd)
    - [Cloud Controller Manager](#cloud-controller-manager)
  - [Node](#node)
    - [kubelet](#kubelet)
    - [kube-proxy](#kube-proxy)
    - [Container Runtime](#container-runtime)
  - [クラスタ](#クラスタ)
  - [マスターノード](#マスターノード)
  - [ワーカーノード](#ワーカーノード)
  - [ReplicaSet](#replicaset)
  - [Deployment](#deployment)
  - [Service](#service)
    - [タイプ](#タイプ)
  - [Ingress](#ingress)
  - [ConfigMap](#configmap)
  - [Secret](#secret)
  - [PVC (Persistent Volume Claim)](#pvc-persistent-volume-claim)
  - [kubeadm](#kubeadm)
  - [kubectl](#kubectl)
  - [参考](#参考)


### ECSとの違い
ECSはAWSが提供するコンテナオーケストレーションサービスで、KubernetesはGoogleが開発したオープンソースのコンテナオーケストレーションツール。
それぞれ、プラットフォームとしての設計思想が異なる。

ECSはKubernetesのように、秘密情報管理やCronJobsのような機能はない。
ただ、Secrets ManagerやEventBridgeのようにAWSの他のサービスを組み合わせることで、同様の機能を実現できる。
このように、それぞれのサービスを疎結合に組み合わせることができ、幅広いユースケースに対応できる。

Kubernetesは、クラウドネイティブなアプリケーションを構築するためのプラットフォームとして設計されている。

### Pod
Kubernetesにデプロイできる最小単位で、1つ以上のコンテナの集合体。  
同じPod内のコンテナはリソースやネットワークを共有している。  
Kubernetesはコンテナを直接管理せず、このPodを管理している。

- [Kubernetes ポッドとは](https://www.redhat.com/ja/topics/containers/what-is-kubernetes-pod)
- [Podとノードについて \| Kubernetes](https://kubernetes.io/ja/docs/tutorials/kubernetes-basics/explore/explore-intro/)

### Control Plane
クラスタの制御を受け持ち、スケジューリングやイベント検知などクラスタ全体に関わる管理を担う。
EKSやGKEといったマネージドサービスではControl Planeはベンダー側が管理して、ユーザーからは隠蔽されている。
以下のようなコンポーネントで構成される。

#### API Server
Kubernetesクラスタの制御を受け持つコンポーネント。
APIリクエストをRESTで受け取り、オブジェクトのCURD操作や認証認可、リクエストの制御などを行う。
Admission Controllerと呼ばれる機能がある。

#### Scheduler
新しいPodをどのNodeに配置するかを決定するコンポーネント。

#### Controller Manager
クラスタ全体の状態を監視し、必要に応じてクラスタの状態を変更、維持する調整ループ（Reconciliation Loop）を実行するコンポーネント。

#### etcd
クラスタの状態を保存するキーバリューストア。

#### Cloud Controller Manager
クラウドプロバイダー固有のコントローラを実行するコンポーネント。
クラウドプロバイダーの機能と連携して、ロードバランサーやボリュームなどのリソースを管理する。

### Node
1つの仮想もしくは物理的なマシン。Nodeは複数のPodを持つことができる。
Nodeには、マスターノードとワーカーノードの種類が存在し、各ノードはマスターによって管理される。

- [Podとノードについて \| Kubernetes](https://kubernetes.io/ja/docs/tutorials/kubernetes-basics/explore/explore-intro/)
- [ノード \| Kubernetes](https://kubernetes.io/ja/docs/concepts/architecture/nodes/)

Node側は以下のようなコンポーネントがある。

#### kubelet
クラスター内の各ノードで実行されるエージェント。
Podの起動や監視などの管理を担い、各コンテナがPodで実行されていることを保証する。

- [Kubernetesのコンポーネント \| Kubernetes](https://kubernetes.io/ja/docs/concepts/overview/components/#kubelet)

#### kube-proxy
ネットワークプロキシの役割を担うコンポーネント。
各Node上で動作し、Cluster IP や Node Port宛のトラフィックなどを適切にルーティングする。

#### Container Runtime
コンテナの実行を担うコンポーネント。Dockerやcontainerdなどが使われる。

### クラスタ
Nodeの集合体。クラスタでは少なくとも1つ以上のマスターノードとワーカーノードが存在する。

### マスターノード
クラスター内のワーカーノードとPodを管理する。複数のマスターコンポーネントによって構成される。

### ワーカーノード
Podを動作させるためのノード。Podとノードコンポーネントによって構成されており、マスターノードによって管理される。

### ReplicaSet
Podのレプリカを作成して、マニュフェストファイルに記述された数のPodを維持する。
NodeやPodの障害によってPodが削除された場合、ReplicaSetは別のノードでPodを再作成する。

### Deployment
ReplicaSetを管理するリソース。ローリングアップデートやローリングバックなどの機能を提供する。

### Service
クラスタ内外からのアクセスをPodにルーティングする機能やDNSの機能を提供する。
Podとの通信に単一のエンドポイントを提供する。  
各PodはそれぞれIPアドレスを持っているが、クラスタの状況に合わせて動的に作成・削除されるためIPアドレスが一定にならない。
そのためPodを抽象化し、静的なIPアドレスを持たせて安定的にアクセスできるようにする。  
Serviceのタイプには以下がある。

#### タイプ
`ClusterIP:`  
クラスタ内のPod同士が、内部DNSで名前解決して通信するプライベートIPアドレス。
クラスタの内部のみアクセスすることができる。デフォルトのタイプ。

`NodePort:`  
クラスタの外部に静的なポートで公開できる。

`LoadBalancer:`  
クラスタの外部に静的なIPを持ったロードバランサーを公開する。  
そのまま各ノードの特定のポートにルーティングしてくれる。

- [Service \| Kubernetes](https://kubernetes.io/ja/docs/concepts/services-networking/service/)

### Ingress
クラスタ外部からのアクセスをServiceにルーティングする機能を提供する。
パスベースのルーティングやTLS終端などの機能を提供する。

### ConfigMap
Podの設定情報を格納するリソース。環境変数やnginx.confなどの設定ファイルを格納できる。

環境変数を使う場合は、
k create configmap config-name --from-liternal=KEY=value

### Secret
ConfigMapと同様にPodの設定情報を格納するリソース。ConfigMapと異なり、機密性の高いデータを格納する。
tmpfs領域の中に保存され、データがメモリ上に保存される。
etcd内では平文で保存される。Nodeにデータを送信する際はover SSL/TLSで暗号化される。

base64エンコードされているが暗号化はされていないため、マニュフェストファイルを暗号化するOSSを利用する。

### PVC (Persistent Volume Claim)
永続化ボリュームをPodにマウントするためのリソース。Podが削除されてもデータが保持される。

### kubeadm
Kubernetesクラスタのセットアップや管理をするツール。  
Kubernetesを構成するコンポーネントや証明書、各種設定ファイルを自動で作成し、素早くKubernetesクラスタを作成できる。

- [Kubeadm \| Kubernetes](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)
- [kubeadmって何やってるの？公式ページをちゃんと読む \- Qiita](https://qiita.com/FY0323/items/6a3b3270888c96ba13d3)
- [Kubernetes環境を構築して、実際にコンテナを動かしてみよう \| Think IT（シンクイット）](https://thinkit.co.jp/article/18188)
- [Kubernetesをオンプレで作る　「kubeadm」のポイントとクラスタアップグレードのハマりどころ \- ログミーTech](https://logmi.jp/tech/articles/322946)

### kubectl
Kubernetesクラスターを制御するためのコマンドラインツール。

- [kubectl CLI \| Kubernetes](https://kubernetes.io/ja/docs/reference/kubectl/_print/)

### 参考
- [Kubernetes \(k8s\) 基本用語学習](https://zenn.dev/akkey/articles/8af85e30cbdde3)
- [コンテナを使いこなすための心強い味方\!「Kubernetes」\(前編\) \| Think IT（シンクイット）](https://thinkit.co.jp/article/17453)
- [Kubernetesのコンポーネント \| Kubernetes](https://kubernetes.io/ja/docs/concepts/overview/components/)
- [Kubernetes アーキテクチャの概要](https://www.redhat.com/ja/topics/containers/kubernetes-architecture)
- [プラットフォームの上でものを作るということ \| トリの部屋](https://toris.io/2019/12/what-i-think-about-when-i-think-about-kubernetes-and-ecs/)