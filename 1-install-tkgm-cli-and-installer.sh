# unzip and install tanzu cli
curl -LO http://10.193.255.12/public_files/vmw/tkg/1.4/tanzu-cli-bundle-linux-amd64.tar
curl -LO http://10.193.255.12/public_files/vmw/tkg/1.4/kubectl-linux-v1.21.2+vmware.1.gz
mkdir tanzu
tar xvf tanzu-cli-bundle-linux-amd64.tar -C tanzu
gunzip kubectl-linux-v1.21.2+vmware.1.gz
chmod 755 kubectl-linux-v1.21.2+vmware.1.gz
sudo mv kubectl-linux-v1.21.2+vmware.1.gz /usr/local/bin/kubectl
cd tanzu/cli
sudo install core/v1.4.0/tanzu-core-linux_amd64 /usr/local/bin/tanzu
cd ..
tanzu plugin install --local cli all
tanzu plugin list

# start web UI to install
tanzu management-cluster create --ui --bind 0.0.0.0:8080
