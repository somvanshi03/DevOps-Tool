# HelmChart

	Helm is a package manager for Kubernetes that uses a packaging format called **charts**. 
	
	Helm commands are used to install, manage, upgrade, and configure Kubernetes applications. 
	
	Below is a **comprehensive list of Helm CLI commands**, with **detailed explanations** for each.



## 📦 Helm Chart Commands (Detailed)

## Helm chart repo 

	https://artifacthub.io/ 
		
		
## Helm Commands (List, add, search)

	helm repo list # Will show which remote repo is added in your local helm server
	
	helm repo add bitnami101 https://charts.bitnami.com/bitnami
	
	helm repo remove bitnami101
	
	helm repo list 
	
	helm search repo nginx 
	
	helm search repo nginx --version 	
	
	helm repo update 
	
	helm install myfirstrepo bitnami101/nginx  # latest chart will be installed 
	
	helm list 
	
	helm ls --output=yaml 

	helm list --namespace=default
	
	kubectl get ns 

	helm ls 
	
	helm uninstall myfirstrepo
	
	helm list 


## Helm Upgrade with set option

	helm repo list 
	
	helm repo add stacksimplify https://stacksimplify.github.io/helm-charts/
	
	helm repo list

	helm search repo mychart1 
	
	helm search repo mychart1 --versions

	helm install myapp1 stacksimplify/mychart1 
	
	helm ls 
	
	helm list 

	helm upgrade myapp1 stacksimplify/mychart1 --set "image.tag=2.0.0"
	
	helm ls
	
	helm list 
	
	Note: New version of docker image will be deployed.
	
	helm list --deployed 
	
	helm list --suerseded
	
## Helm history and status 

	helm history myapp1
	
	helm status myapp1

	helm status myapp1 --show-desc
	
	helm status myapp1  --show-resources 
	
	helm status RELEASE_NAME --revision int
	
	helm status myapp1 --revision 2


## Helm Uninstall

	helm uninstall myapp1
	
	

## Upgrade the charts via chart no 

	helm search repo mychart2
	
	helm search repo mychart2 --versions 
	
	helm search repo mychart2 --version "0.3.0"
	
	helm install myapp1 stacksimplify/mychart2 --version "0.1.0"
	
	helm list 
	
	helm status myapp1 --show-resources

	helm upgrade myapp1 stacksimplify/mychart2 --version "0.2.0"
	
	helm list 
	
	helm ls 
	
	helm status myapp1 --show-resources
	
	

## Rollback 

	helm history myapp1
	
	helm list 
	
	helm rollback myapp1
	
	helm status myapp1
	
	helm list 
	
	helm history myapp1
	
	helm rollback myapp1 1 #1 is revision no 



## Uninstall with keep history 

	helm list 
	
	helm list --suerseded
	
	helm list --deployed
	
	helm history myapp1
	
	helm uninstall myapp1 --keep-history
	
	helm list --uninstalled 
	
	helm status myapp1
	
## Rollback Uinstalled Release 

	helm history myapp1
	
	helm rollback myapp 3 
	
	helm list 
	
	helm history myapp1
	
	helm status myapp1 --show-resources
	

## Install with generate-name flag 

	
	helm list 
	
	helm install stacksimplify/mychart2 --generate-name 
	
	helm status myapp1*******




