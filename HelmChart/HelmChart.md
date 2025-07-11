# HelmChart


## Day 1: 

### Install helm on Ubuntu
 	
	sudo apt update
	
	sudo apt install -y curl
	
	https://helm.sh/docs/intro/install/
	
	curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
	
	or 
	
	
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
	
    chmod 700 get_helm.sh
	
    ./get_helm.sh
	
	
	helm version

	
	Download kubectl and paste it in /bin dir
	
	curl -LO https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl
	
	mv kubectl /bin 
	
	kubectl version --short
	
	kubectl get nodes
	
	kubectl get pods
	
	kubectl get pods -A 


### Install helm on windows

	Download and copy in system32 
	
	https://github.com/helm/helm/releases
	
	helm version
	
	
	Download Docker for windows and enable K8S single cluster 
	
	Download kubectl and paste it in system32 dir
	
	curl.exe -LO "https://dl.k8s.io/release/v1.33.0/bin/windows/amd64/kubectl.exe" 
	
	kubectl version --short
	
	kubectl get nodes
	
	kubectl get pods
	
	kubectl get pods -A 

### List the Kube Context

	kubectl config get-context 
	
	kubectl config current-context 



### Helm chart repo 

		https://artifacthub.io/ 
		
		
### Helm Commands (List, add, search)

	helm repo list # Will show which remote repo is added in your local helm server
	
	helm repo add bitnami101 https://charts.bitnami.com/bitnami
	
	helm repo remove bitnami101
	
	helm repo list 
	
	helm search repo nginx 
	
	helm search repo nginx --version 
	

### Helm Commands (Update, Install, Uninstall, release)	
	
	
	helm repo update 
	
	helm install myfirstrepo bitnami101/nginx  # latest chart will be installed 
	
	helm list 
	
	helm ls --output=yaml 

	helm list --namespace=default
	
	kubectl get ns 

	helm ls 
	
	helm uninstall myfirstrepo
	
	helm list 


### Helm Upgrade with set option













### Userfull links

	https://github.com/stacksimplify/helm-masterclass 
	
	https://github.com/stacksimplify/helm-charts
	
	https://github.com/stacksimplify/helm-charts-repo
	
	https://github.com/stacksimplify/helm-masterclass


## Helm Commands

	helm create
	
	helm install
	
	helm upgrade
	
	helm rollback
	
	helm package
	
	helm list
	
	helm repo
	
	helm search


	helm lint
	
	helm template
	
	helm get
	
	helm history
	
	helm pull
	
	helm plugin
	
	helm show
	
	helm status
	
	

	helm test
	
	helm verify
	
	helm version
	
	helm env
	
	helm dependency
	
	helm push
	
	helm uninstall
	
	helm help
 