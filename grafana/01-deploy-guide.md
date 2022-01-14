## Deploy Grafana Extension 
部署說明

#### 1. 部署 cert-manager if its not already installed (or 自帶憑證跳過此步驟)

```sh
kubectl apply -f ../cert-manager/01-cert-manager.-namespace.yaml
kubectl apply -f ../cert-manager/02-cert-manager-crds.yaml
kubectl apply -f ../cert-manager/03-cert-manager.yaml
```

#### 2. 建立一個 grafana 用 namespace role/rolebinding

```sh
kubectl apply -f namespace-role.yaml
```

#### 3. 複製 `grafana-data-values.yaml.example` 並命名 `grafana-data-values.yaml`
    
```sh
cp grafana-data-values.yaml.example grafana-data-values.yaml
```
    
#### 4. 確認 `grafana-data-values.yaml` 中 image repository 位置、輸入密碼及客製化修改。

#### 5. 新增 secret 

```sh
kubectl create secret generic grafana-data-values --from-file=values.yaml=grafana-data-values.yaml -n tanzu-system-monitoring
```

#### 6. Deploy grafana extension

```sh
kubectl apply -f grafana-extension.yaml
```

#### 7. 檢查狀態

```sh
kubectl get app grafana -n tanzu-system-monitoring
```

   要出現 `Reconcile Succeeded`

#### 8. 匯出交付文件

```sh
kubectl get app grafana -n tanzu-system-monitoring -o yaml
```
