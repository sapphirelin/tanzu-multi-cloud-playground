# Contour namespace 創建
kubectl apply -f extensions/ingress/contour/namespace-role.yaml
 
# data-values 篇集
cp extensions/ingress/contour/vsphere/contour-data-values-lb.yaml.example extensions/ingress/contour/vsphere/contour-data-values.yaml
 
# Ingress Servicetype 查看
cat extensions/ingress/contour/vsphere/contour-data-values.yaml
 
#@data/values
#@overlay/match-child-defaults missing_ok=True
---
infrastructure_provider: "vsphere"
contour:
 image:
   repository: registry.tkg.vmware.run
envoy:
 image:
   repository: registry.tkg.vmware.run
 service:
   type: LoadBalancer
 
# Secret 創建
kubectl create secret generic contour-data-values --from-file=values.yaml=extensions/ingress/contour/vsphere/contour-data-values.yaml -n tanzu-system-ingress
# contour app 創建
kubectl apply -f extensions/ingress/contour/contour-extension.yaml
 
# 查看狀態
kubectl -n tanzu-system-ingress get extension contour
kubectl -n tanzu-system-ingress get app contour --watch
 
# 匯出
kubectl get app contour -n tanzu-system-ingress -o yaml
 
# 若需要 ingress management port forwarding 來訪問用戶端
ENVOY_POD=$(kubectl -n tanzu-system-ingress get pod -l app=envoy -o name | head -1)
kubectl -n tanzu-system-ingress port-forward $ENVOY_POD 9001
