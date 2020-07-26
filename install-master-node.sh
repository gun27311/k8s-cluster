sudo apt-get update
sudo apt install -y apt-transport-https
curl -s \
https://packages.cloud.google.com/apt/doc/apt-key.gpg |\
sudo apt-key add -

sudo touch /etc/apt/sources.list.d/kubernetes.list
echo \
"deb http://apt.kubernetes.io/ kubernetes-xenial main" |\
sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubeadm
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get nodes
