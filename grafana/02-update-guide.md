## Update Grafana 更新方式
更新方式

#### 1. 複製一份目前的 data-values 

```sh
kubectl get secret grafana-data-values -n tanzu-system-monitoring -o 'go-template={{ index .data "values.yaml" }}' | base64 -d > grafana-data-values.yaml
```

#### 2. 複製 `grafana-data-values.yaml` 並命名 `grafana-data-values-previous.yaml` 保留備份以利還原

```sh
cp grafana-data-values.yaml grafana-data-values-previous.yaml
```

#### 3. 修改 `grafana-data-values.yaml`

```sh
vim grafana-data-values.yaml
```

#### 4. 更新 secret

```sh
kubectl create secret generic grafana-data-values --from-file=values.yaml=grafana-data-values.yaml -n tanzu-system-monitoring -o yaml --dry-run | kubectl replace -f-
```

#### 5. 檢查更新狀態

```sh
kubectl get app grafana -n tanzu-system-monitoring
```

   要出現 `Reconcile Succeeded`

#### 6. 匯出交付文件

```sh
kubectl get app grafana -n tanzu-system-monitoring -o yaml
```
