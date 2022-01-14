# kapp-controller - TKG Extension 的生命週期管理工具

## 生命週期管理操作方式

### 列出 extensions 狀態
```sh
kapp list -n <namespace>
```
e.g. prometheus
![Imgur](https://i.imgur.com/hzMZ7y5.png)

### 修改 extensions 映像檔倉庫位址

1. 設定 harbor 或其他 REGISTRY 路徑及版本
```sh
export STAGING_IMAGE_REGISTRY=projects-stg.registry.vmware.com/tkg
export IMAGE_TAG=v1.3.0_vmware.1
```

2. 替換 `kapp-controller.yaml` 和 `cert-manager.yaml` 中的映像檔路徑

```sh
sed -i -e "s|image: .*/\(.*\):\(.*\)|image: ${STAGING_IMAGE_REGISTRY}/\1:\2|" extensions/kapp-controller.yaml
rm -rf extensions/kapp-controller.yaml-e

sed -i -e "s|image: .*/\(.*\)/\(.*\):\(.*\)|image: ${STAGING_IMAGE_REGISTRY}/\1/\2:\3|" cert-manager/*-cert-manager.yaml
rm -rf cert-manager/*-cert-manager.yaml-e
```

3. 替換所有 `<extension-name>-extension.yaml` 中的映像檔路徑

    ```sh
    find extensions/ -name *-extension.yaml | xargs sed -i -e "s|url: .*tkg-extensions-templates:.*|url: ${STAGING_IMAGE_REGISTRY}/tkg-extensions-templates:${IMAGE_TAG}|"
    find extensions/ -name *.yaml-e | xargs rm -rf
    ```
4. 修改所有 extensions 的 <extension-name>-data-values.yaml 檔案中 `image.repository` 路徑。

## 安裝與部署
* TKGm 環境皆已內裝
* 若為 vSphere with Tanzu TKG Service 環境才需安裝。

### Prerequisites
* 一座 Workload cluster (TKC)

### Install

調整設定檔案
```sh
kubectl apply -f kapp-controller-config.yaml
```

安裝 kapp-controller

```sh
kubectl apply -f kapp-controller.yaml
```

