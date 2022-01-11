# Prometheus Extension

## Prerequisites

* 一座 Workload cluster (TKC)
* ytt installed (<https://github.com/k14s/ytt/releases>)
* kapp installed (<https://github.com/k14s/kapp/releases>)
* TKGm workload cluster 已經預安裝 kapp-controller

## Installation

#### 1. 部署 cert-manager if its not already installed

    ```sh
    kubectl apply -f ../cert-manager/01-cert-manager.-namespaceyaml
    kubectl apply -f ../cert-manager/02-cert-manager-crds.yaml
    kubectl apply -f ../cert-manager/03-cert-manager.yaml
    ```

#### 2. 建立一個 prometheus 用 namespace

    ```sh
    kubectl apply -f namespace-role.yaml
    ```

