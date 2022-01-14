# Grafana Extension 

以 TKG Extension 1.3.1 安裝於 TKG 1.4.1 環境為例

## Prerequisites

* 一座 Workload cluster (TKC)
* 安裝 ytt CLI (<https://github.com/k14s/ytt/releases>)
* 安裝 kapp CLI (<https://github.com/k14s/kapp/releases>)
* TKGm workload cluster 已經預安裝 kapp-controller，不用重複安裝。若為其他 cluster 請安裝：
```
kubectl apply -f kapp-controller.yaml
```

clone files:
* namespace-role.yaml
* grafana-data-values.yaml.example
* grafana-extension.yaml

## Guide

* [安裝部署一座 Grafana](./01-deploy-guide.md)
* [更新 Grafana](./02-update-guide.md)
* [刪除 Grafana](./03-delete-guide.md)
