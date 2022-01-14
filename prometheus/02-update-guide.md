## Update Prometheus Extension 更新
若需要更換憑證/增加其他 Exporter plugins 等，會需要修改 data values 設定。
此時可參照如下更新整座 Prometheus

#### 1. 複製一份目前的 data-values 列表

```sh
kubectl get secret prometheus-data-values -n tanzu-system-monitoring -o 'go-template={{ index .data "values.yaml" }}' | base64 -d > prometheus-data-values.yaml
```

#### 2. 複製 `prometheus-data-values.yaml` 並命名 `prometheus-data-values-previous.yaml` 保留備份以利還原

```sh
cp prometheus-data-values.yaml prometheus-data-values-previous.yaml
```

#### 3. 修改 `prometheus-data-values.yaml`

```sh
vim prometheus-data-values.yaml
```

#### 4. 更新 secret

```sh
kubectl create secret generic prometheus-data-values --from-file=values.yaml=prometheus-data-values.yaml -n tanzu-system-monitoring -o yaml --dry-run | kubectl replace -f-
```

#### 5. 檢查更新狀態

```sh
kubectl get app prometheus -n tanzu-system-monitoring
```

   要出現 `Reconcile Succeeded`

#### 6. 匯出交付文件

```sh
kubectl get app prometheus -n tanzu-system-monitoring -o yaml
```
