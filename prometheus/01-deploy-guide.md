## Deploy Prometheus Extension 
安裝部署說明

#### 1. 部署 cert-manager if its not already installed (or 自帶憑證跳過此步驟)

```sh
kubectl apply -f ../cert-manager/01-cert-manager.-namespace.yaml
kubectl apply -f ../cert-manager/02-cert-manager-crds.yaml
kubectl apply -f ../cert-manager/03-cert-manager.yaml
```

#### 2. 建立一個 prometheus 用 namespace

```sh
kubectl apply -f namespace-role.yaml
```

#### 3. 複製 `prometheus-data-values.yaml.example` 並命名 `prometheus-data-values.yaml`
    
```sh
cp prometheus-data-values.yaml.example prometheus-data-values.yaml
```
    
#### 4. 確認 `prometheus-data-values.yaml` 中 image repository 位置，及客製化修改。

#### 5. 用 `prometheus-data-values.yaml` 新增 secret 

```sh
kubectl create secret generic prometheus-data-values --from-file=values.yaml=prometheus-data-values.yaml -n tanzu-system-monitoring
```

#### 6. Deploy prometheus extension

```sh
kubectl apply -f prometheus-extension.yaml
```

#### 7. 檢查狀態是否出現 

```sh
kubectl get app prometheus -n tanzu-system-monitoring
```

   要出現 `Reconcile Succeeded`

#### 8. 匯出交付文件

```sh
kubectl get app prometheus -n tanzu-system-monitoring -o yaml
```
