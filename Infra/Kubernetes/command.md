### minikube コマンド

#### クラスター開始
```
minikube start
```

#### ダッシュボード表示
```
minikube dashboard
```

#### クラスター停止
```
minikube stop
```

#### デプロイ
```
kubectl apply -f nginx-pod.yaml
```

#### Pod一覧表示
```
kubectl get pod
```

#### Pod詳細表示
```
kubectl describe pod [Pod名]
```

#### コンテナに入る
```
kubectl exec -it [Pod名] -- bash
```

#### Pod削除
```
kubectl delete pod [Pod名]
```