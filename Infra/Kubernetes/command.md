### minikube コマンド

#### クラスター開始
```babash
minikube start
```

#### ダッシュボード表示
```bash
minikube dabashboard
```

#### クラスター停止
```bash
minikube stop
```

### kubectl コマンド

#### デプロイ
```bash
kubectl apply -f nginx-pod.yaml
```

#### リプレイス
```bash
kubectl replace --force -f nginx-pod.yaml
```

#### all 表示
```bash
kubectl get all
```

#### 一覧表示
```bash
# Pod
kubectl get pod
kubectl get pod -o wide

# -A (--all-namespaces) 全てのNamespaceのPodを表示
kubectl get pod -A

# ReplicaSet
kubectl get rs

# Service
kubectl get svc

# Namespace
kubectl get ns
```

#### 詳細表示
```bash
# Pod
kubectl describe pod [Pod名]

# ReplicaSet
kubectl describe rs [ReplicaSet名]
```

#### コンテナに入る
```bash
kubectl exec -it [Pod名] -- babash
```

#### Pod削除
```bash
kubectl delete pod [Pod名] [Pod名]...
```

#### 設定編集
```bash
# Pod
kubectl edit pod [Pod名]

# ReplicaSet
kbuectl edit rs [ReplicaSet名]
```

#### ReplicaSetスケール
```bash
kubectl scale rs [ReplicaSet名] --replicas=3
```

#### explain
```bash
kubectl explain replicaset
```

#### namespace switch
```bash
kubectl config set-context --current --namespace=[Namespace名]
```

#### Podの数をカウント
```bash
kubectl get pod --selector env=dev,tier=front-end --no-headers | wc -l
```

#### taintを追加
```bash
kubectl taint nodes node1 key=value:NoSchedule
```

#### taintを削除
```bash
kubectl taint nodes node1 key:NoSchedule-
```

#### tolerationを追加
```yaml
tolerations:
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoSchedule"
```
- https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/

#### メトリクスを取得
```bash
kubectl top pod
kubectl top node
```

#### HPAを設定
```bash
kubectl autoscale deployment [Deployment名] --min=1 --max=10 --cpu-percent=80
```

#### HPAを取得
```bash
kubectl get hpa
```

#### ログを取得
```bash
kubectl logs -f [Pod名]
```

#### ネームスペースの一覧を表示
```bash
kubectl get ns
```

#### プロセスをチェックして、kube-apiserverの有効なプラグインと無効なプラグインを確認
```bash
ps -ef | grep kube-apiserver | grep admission-plugins
```

#### ローリングアップデート
```bash
# ローリングアップデートの状態を確認
kubectl rollout status deploment [Deployment名]

# ローリングアップデートの履歴を確認
kubectl rollout histry deployment [Deployment名]

# ローリングアップデートを元に戻す
kubectl rollout undo deployment [Deployment名]
```

#### デプロイメントのyamlを取得
```bash
kubectl get deployment nginx-deployment -o yaml
```

#### configmapの作成
```bash
kubectl create configmap my-name --from-literal=KEY=value
```

#### configmapの取得
```bash
k get cm
k describe cm my-name
```