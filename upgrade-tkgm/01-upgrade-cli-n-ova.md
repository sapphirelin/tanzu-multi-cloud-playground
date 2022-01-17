# Upgrade 

[Documents](https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.4/vmware-tanzu-kubernetes-grid-14/GUID-upgrade-tkg-index.html)

## download CLI & ova

1. login [My VMware](https://my.vmware.com/) then close the tab
2. visit [tkg download pages](https://my.vmware.com/en/web/vmware/downloads/info/slug/infrastructure_operations_management/vmware_tanzu_kubernetes_grid/1_x) dl `VMware Tanzu CLI 1.4.1 CLI`
3. unzip
```
tar -xvf tanzu-cli-bundle-linux-amd64.tar
```
![](https://i.imgur.com/xmFoDqL.png)


## upgrade tanzu CLI

1. check current version

```
tanzu version
```
![](https://i.imgur.com/LrdCpM1.png)

2. install tanzu CLI
```
cd cli
sudo install core/v1.4.1/tanzu-core-linux_amd64 /usr/local/bin/tanzu
tanzu version
```
![](https://i.imgur.com/jjIbJpq.png)

3. clean and install CLI plugins
```
tanzu plugin clean
tanzu plugin install --local cli all
tanzu plugin list
```


## upgrade kubectl
![]()

## dl os images and put it in vCenter
![](https://i.imgur.com/BbCfUI4.png)

