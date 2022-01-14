# Carvel

VMware 開發的 CLI 安裝包

包含如下 command line tools:
* [ytt](https://carvel.dev/ytt/)
* [kbld](https://carvel.dev/kbld/)
* [kapp](https://carvel.dev/kapp/)
* [kwt](https://github.com/vmware-tanzu/carvel-kwt) (實驗專案)
* [imgpkg](https://carvel.dev/imgpkg/)
* [vendir](https://carvel.dev/vendir/)


## Installation

dl and install
```sh
mkdir carvel/
cd carvel/
wget -O- https://raw.githubusercontent.com/sapphirelin/tanzu-multi-cloud-playground/main/carvel/install.sh > install.sh
sudo bash install.sh
```
check
```sh
kapp version
ytt version
```

* ytt_version=v0.38.0
* kbld_version=v0.32.0
* kapp_version=v0.44.0
* kwt_version=v0.0.6
* imgpkg_version=v0.24.0
* vendir_version=v0.23.0
