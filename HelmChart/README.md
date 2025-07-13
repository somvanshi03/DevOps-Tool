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
	
	helm status mychart2******


## Helm Install Atomic Flag

	# To remove all added repositories in Helm, you can use the following command:
	helm repo list -o json | jq -r '.[].name' | xargs -n1 helm repo remove
	
	helm install dev101 stacksimplify/mychart1

	# List Helm Release
	helm list 

	# List Kubernetes Resources Deployed as part of this Helm Release
	helm status dev101 --show-resources

	# Access Application
	http://localhost:31231


	# Install Helm Chart 
	helm install qa101 stacksimplify/mychart1

	# List Helm Release
	helm list 
	Observation: You should see qa101 release installed with FAILED status

	Error: INSTALLATION FAILED: 1 error occurred:
		* Service "qa101-mychart1" is invalid: spec.ports[0].nodePort: Invalid value: 31231: provided port is already allocated

	# Uninstall qa101 release which is in failed state
	helm uninstall qa101

	# List Helm Release
	helm list 
	
	
	# Install Helm Chart 
	helm install qa101 stacksimplify/mychart1 --atomic

	# List Helm Release
	helm list 
	Observation: We will not see qa101 FAILED release, --atomic flag deleted the release as soon as it is failed with error

	Error: INSTALLATION FAILED: 1 error occurred:
		* Service "qa101-mychart1" is invalid: spec.ports[0].nodePort: Invalid value: 31231: provided port is already allocated


	# Uninstall dev101 release
	helm uninstall dev101

	# List Helm Releases
	helm list
	

## Helm with Kubernetes Namespaces

	# To remove all added repositories in Helm, you can use the following command:
	helm repo list -o json | jq -r '.[].name' | xargs -n1 helm repo remove
	
	# List Kubernetes Namespaces 
	kubectl get ns

	# Install Helm Release by creating Kubernetes Namespace
	helm install dev101 stacksimplify/mychart2 --version "0.1.0" --namespace dev --create-namespace 

	# List Kubernetes Namespaces 
	kubectl get ns
	Observation: Found the dev namespace created as part of `helm install`

	# List Helm Release
	helm list --> NO RELEASES in default namespace
	helm list -n dev
	helm list --namespace dev

	# Helm Status
	helm status dev101 --show-resources -n dev
	helm status dev101 --show-resources --namespace dev

	# List Kubernetes Pods
	kubectl get pods -n dev
	kubectl get pods --namespace dev

	# List Services
	kubectl get svc -n dev

	# List Deployments
	kubectl get deploy -n dev

	# Access Application
	http://localhost:31232
	
	
	# Helm Upgrade
	helm upgrade dev101 stacksimplify/mychart2 --version "0.2.0" --namespace dev 
	or
	helm upgrade dev101 stacksimplify/mychart2 --version "0.2.0" -n dev

	# List Helm Release
	helm list -n dev
	helm list --namespace dev

	# Helm Status
	helm status dev101 --show-resources -n dev
	helm status dev101 --show-resources --namespace dev

	# Access Application
	http://localhost:31232
	
	
	# Uninstall Helm Releas
	helm uninstall dev101 --namespace dev
	helm uninstall dev101 -n dev

	# List Helm Release
	helm list -n dev
	helm list --namespace dev

	# List Kubernetes Namespaces
	kubectl get ns
	Observation: 
	1. When uninstalling helm release, it will not delete the Kubernetes Resource: dev namespace. 
	2. If we dont need that dev namespace we need to manually delete it from kubernetes using kubectl

	# Delete dev namespace
	kubectl delete ns dev

	# List Kubernetes Namespaces
	kubectl get ns