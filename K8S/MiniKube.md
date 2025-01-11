# Install MiniKube on Ubuntu 22.04

## update OS

	apt update && apt upgrade -y

## Install Docker and modify user group

	sudo apt install -y && sudo apt install docker.io
	sudo usermod -aG docker $USER
	newgrp docker


##	Install minikube 

	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
	minikube version

##	Install kubectl

	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

	chmod +x kubectl
	sudo mv kubectl /usr/local/bin/

## Start Minikube 

	minikube start --driver=docker --force
	kubectl get nodes
	kubectl get pods
	kubectl get pods -A 
	
