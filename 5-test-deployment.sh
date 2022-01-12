tanzu cluster kubeconfig get tkg-cluster-1 --admin
kubectl config use-context tkg-cluster-1-admin@tkg-cluster-1

kubectl create deployment nginx --image sapphire.registry.vmware.com/nginx

kubectl expose deployment nginx --type LoadBalancer --port 80
kubectl get svc nginx
