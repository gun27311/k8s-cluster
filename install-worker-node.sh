sudo apt-get update
sudo apt install -y apt-transport-https
curl -s \
https://packages.cloud.google.com/apt/doc/apt-key.gpg |\
sudo apt-key add -
apt install docker.io

sudo touch /etc/apt/sources.list.d/kubernetes.list
echo \
"deb http://apt.kubernetes.io/ kubernetes-xenial main" |\
sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubeadm

#kubeadm join <MASTER_NODE_IP>:6443 --token jtadhb.cv1o6qi62g1n85s9 --discovery-token-ca-cert-hash sha256:ffd679b0444cb1d8dd67dab42e232c9...
#JOIN NODE 
