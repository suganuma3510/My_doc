## Kubernetes
### Pod
Kubernetesにデプロイできる最小単位で、1つ以上のコンテナの集合体。  
同じPod内のコンテナはリソースやネットワークを共有している。  
Kubernetesはコンテナを直接管理せず、このPodを管理している。

- [Kubernetes ポッドとは](https://www.redhat.com/ja/topics/containers/what-is-kubernetes-pod)
- [Podとノードについて \| Kubernetes](https://kubernetes.io/ja/docs/tutorials/kubernetes-basics/explore/explore-intro/)

### Node
1つの仮想もしくは物理的なマシン。Nodeは複数のPodを持つことができる。  
Nodeには、マスターノードとワーカーノードの種類存在し、各ノードはマスターによって管理される。

- [Podとノードについて \| Kubernetes](https://kubernetes.io/ja/docs/tutorials/kubernetes-basics/explore/explore-intro/)
- [ノード \| Kubernetes](https://kubernetes.io/ja/docs/concepts/architecture/nodes/)

### クラスタ
Nodeの集合体。クラスタでは少なくとも1つ以上のマスターノードとワーカーノードが存在する。

### マスターノード
クラスター内のワーカーノードとPodを管理する。複数のマスターコンポーネントによって構成される。

### ワーカーノード
Podを動作させるためのノード。Podとノードコンポーネントによって構成されており、マスターノードによって管理される。

### Service
Podとの通信に単一のエンドポイントを提供する。  
各PodはそれぞれIPアドレスを持っているが、クラスタの状況に合わせて動的に作成・削除されるためIPアドレスが一定にならない。
そのためPodを抽象化し、静的なIPアドレスを持たせて安定的にアクセスできるようにする。  
Serviceのタイプには などがある。

#### タイプ
`ClusterIP:`  
クラスタの内部のみアクセスすることができる。デフォルトのタイプ。

`NodePort:`  
クラスタの外部に静的なポートで公開できる。

`LoadBalancer:`  
クラスタの外部に静的なIPを持ったロードバランサーを公開する。  
そのまま各ノードの特定のポートにルーティングしてくれる。

- [Service \| Kubernetes](https://kubernetes.io/ja/docs/concepts/services-networking/service/)

### kubeadm
Kubernetesクラスタのセットアップや管理をするツール。  
Kubernetesを構成するコンポーネントや証明書、各種設定ファイルを自動で作成し、素早くKubernetesクラスタを作成できる。

- [Kubeadm \| Kubernetes](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)
- [kubeadmって何やってるの？公式ページをちゃんと読む \- Qiita](https://qiita.com/FY0323/items/6a3b3270888c96ba13d3)
- [Kubernetes環境を構築して、実際にコンテナを動かしてみよう \| Think IT（シンクイット）](https://thinkit.co.jp/article/18188)
- [Kubernetesをオンプレで作る　「kubeadm」のポイントとクラスタアップグレードのハマりどころ \- ログミーTech](https://logmi.jp/tech/articles/322946)

### kubelet
クラスター内の各ノードで実行されるエージェント。  
Podの起動や監視などの管理を担い、各コンテナがPodで実行されていることを保証する。

- [Kubernetesのコンポーネント \| Kubernetes](https://kubernetes.io/ja/docs/concepts/overview/components/#kubelet)

### kubectl
Kubernetesクラスターを制御するためのコマンドラインツール。

- [kubectl CLI \| Kubernetes](https://kubernetes.io/ja/docs/reference/kubectl/_print/)

### 参考
- [Kubernetes \(k8s\) 基本用語学習](https://zenn.dev/akkey/articles/8af85e30cbdde3)
- [コンテナを使いこなすための心強い味方\!「Kubernetes」\(前編\) \| Think IT（シンクイット）](https://thinkit.co.jp/article/17453)
- [Kubernetesのコンポーネント \| Kubernetes](https://kubernetes.io/ja/docs/concepts/overview/components/)
- [Kubernetes アーキテクチャの概要](https://www.redhat.com/ja/topics/containers/kubernetes-architecture)