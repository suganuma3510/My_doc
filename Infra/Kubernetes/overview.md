## Kubernetes
### Pod
Kubernetesにデプロイできる最小単位で、1つ以上のコンテナの集合体。  
同じPod内のコンテナはリソースやネットワークを共有している。  
Kubernetesはコンテナを直接管理せず、このPodを管理している。

### Node
1つの仮想もしくは物理的なマシン。Nodeは複数のPodを持つことができる。  
Nodeには、マスターノードとワーカーノードの種類存在し、各ノードはマスターによって管理される。

### クラスタ
Nodeの集合体。

### Service
Podとの通信に単一のエンドポイントを提供する。  
各PodはそれぞれIPアドレスを持っているが、クラスターの状況に合わせて動的に作成・削除されるためIPアドレスが一定にならない。
そのためPodを抽象化し、静的なIPアドレスを持たせて安定的にアクセスできるようにする。  
Serviceのタイプには などがある。

#### タイプ
`ClusterIP:`  
クラスターの内部のみアクセスすることができる。デフォルトのタイプ。

`NodePort:`  
クラスターの外部に静的なポートで公開できる。

`LoadBalancer:`
クラスターの外部に静的なIPを持ったロードバランサーを公開する。  
そのまま各ノードの特定のポートにルーティングしてくれる。

### 参考
- [Kubernetes ポッドとは](https://www.redhat.com/ja/topics/containers/what-is-kubernetes-pod)
- [Podとノードについて \| Kubernetes](https://kubernetes.io/ja/docs/tutorials/kubernetes-basics/explore/explore-intro/)
- [ノード \| Kubernetes](https://kubernetes.io/ja/docs/concepts/architecture/nodes/)
- [Kubernetes \(k8s\) 基本用語学習](https://zenn.dev/akkey/articles/8af85e30cbdde3)
- [Service \| Kubernetes](https://kubernetes.io/ja/docs/concepts/services-networking/service/)