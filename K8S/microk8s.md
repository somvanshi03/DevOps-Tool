
sudo apt update && sudo apt upgrade -y
sudo snap install microk8s --classic

sudo usermod -a -G microk8s $USER
sudo newgrp microk8s

sudo microk8s status --wait-ready


microk8s enable dns 
microk8s enable dashboard
microk8s enable storage

microk8s kubectl get nodes
microk8s kubectl get services
