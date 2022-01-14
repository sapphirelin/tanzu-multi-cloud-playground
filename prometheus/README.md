# Prometheus Extension 

目前本文以 TKG Extension 1.3.1 安裝於 TKG 1.4.1 環境為例

## Prerequisites

* 一座 Workload cluster (TKC)
* 安裝 ytt CLI (<https://github.com/k14s/ytt/releases>)
* 安裝 kapp CLI (<https://github.com/k14s/kapp/releases>)
* TKGm workload cluster 已經預安裝 kapp-controller，不用重複安裝。

clone files:
* namespace-role.yaml
* prometheus-data-values.yaml.example
* prometheus-extension.yaml

## Guide

* [安裝部署一座 Prometheus](./01-deploy-guide.md)
* [更新 Prometheus](./02-update-guide.md)
* [調整更新頻率](./03-update-syncperiod-guide.md)
* [刪除 Prometheus](./04-delete-guide.md)
