# kapp-controller - TKG Extension 的生命週期管理工具

* TKGm 環境皆已內裝
* 若為 vSphere with Tanzu TKG Service 環境才需安裝。

## LCM Guide 生命週期管理操作方式

```sh
kapp list -n <namespace>
```
e.g. prometheus
![Imgur](https://i.imgur.com/hzMZ7y5.png)


## Prerequisites

* 一座 Workload cluster (TKC)


## Install

調整設定檔案
```sh
kubectl apply -f kapp-controller-config.yaml
```

安裝 kapp-controller

```sh
kubectl apply -f kapp-controller.yaml
```

