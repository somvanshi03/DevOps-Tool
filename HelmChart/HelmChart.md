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

#### Add Custom repo 

	helm repo list 
	
	helm repo add stacksimplify https://stacksimplify.github.io/helm-charts/
	
	helm repo list

	helm search repo mychart1 
	
	helm search repo mychart1 --versions

	helm install myapp1 stacksimplify/mychart1 
	
	helm ls 
	
	helm list 
	
#### Upgrade the charts

	helm upgrade myapp1 stacksimplify/mychart1 --set "image.tag=2.0.0"
	
	helm ls
	
	helm list 
	
	Note: New version of docker image will be deployed.
	
	helm list --deployed 
	
	helm list --suerseded
	
#### Helm history and status 

	helm history myapp1
	
	helm status myapp1

	helm status myapp1 --show-desc
	
	helm status myapp1  --show-resources 
	
	helm status RELEASE_NAME --revision int
	
	helm status myapp1 --revision 2


#### Helm Uninstall

	helm uninstall myapp1
	
	

#### Upgrade the charts via chart no 

	helm search repo mychart2
	
	helm search repo mychart2 --versions 
	
	helm search repo mychart2 --version "0.3.0"
	
	helm install myapp101 stacksimplify/mychart2 --versions "0.1.0"
	
	helm list 
	
	helm status myapp101 --show-resources

	helm upgrade myapp101 stacksimplify/mychart2 --versions "0.2.0"
	
	helm list 
	
	helm ls 
	
	helm status myapp101 --show-resources
	
	

#### Rollback 

	helm history myapp101
	
	helm list 
	
	helm rollback myapp101
	
	helm status myapp101
	
	helm list 
	
	helm history myapp101
	
	helm rollback myapp101 1 #1 is revision no 



#### Uninstall with keep history 

	






























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
 