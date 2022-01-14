## 調整 Prometheus 更新頻率 
預設為 5 分鐘 <= 5 minutes，如需調整

#### 1. 修改 [prometheus-extension.yaml](prometheus-extension.yaml) 檔案

```sh
vim prometheus-extension.yaml
```
調整 Line 11 `syncPeriod`

#### 2. 更新

```sh
kubectl apply -f prometheus-extension.yaml
```
