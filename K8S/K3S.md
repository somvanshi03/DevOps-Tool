# Set up K3s Kubernetes Cluster on Ubuntu 22.04

## Install K3s
	
	curl -sfL https://get.k3s.io | sh 
	
## Status

	systemctl status k3s
	
## Default Kubernetes Object

	sudo kubectl get all -n kube-system

## Adjust the Configuration setting in K3s

	If you want to disable Traefik while installing K3s, you have the option to use the environment variable INSTALL_K3S_EXEC to pass the flags to the K3s service.
	
	curl -sfL https://get.k3s.io  | INSTALL_K3S_EXEC="--disable=traefik" sh -
	
## Uninstall K3s

	/usr/local/bin/k3s-uninstall.sh
	
## Status

	systemctl status k3s
	
