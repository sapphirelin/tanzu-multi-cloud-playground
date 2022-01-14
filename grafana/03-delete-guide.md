## Delete Grafana Extension 
刪除說明

#### 1. 刪除應用本身

```sh
kubectl delete -f grafana/grafana-extension.yaml
kubectl delete app grafana -n tanzu-system-monitoring
```

#### 2. 檢查狀態 

```sh
kubectl get app grafana -n tanzu-system-monitoring
```

   要出現 `Not Found`

#### 3. 確認第 2 步驟完全刪除應用後，移除 namespace

```sh
kubectl delete -f grafana/namespace-role.yaml
```
務必完整刪除應用後執行，否則會因為  service account 被移除造成 errors
