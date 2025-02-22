# NFS Server

## Install NFS on Centos/RHEL

    sudo yum install -y nfs-utils

## Install NFS on Ubuntu

	sudo apt update
	sudo apt install nfs-kernel-server

## Install NFS Clint on Ubuntu

	sudo apt update
	sudo apt install nfs-common
	
## ## Start Service on Ubuntu

	sudo systemctl start nfs-kernel-server
	sudo systemctl enable nfs-kernel-server

## Start Service on Centos/RHEL

    systemctl enable nfs-server
    systemctl start nfs-server

## Edit Export File

    sudo vi /etc/exports
	
	/webdata/Oracle *(rw,sync,no_subtree_check,no_root_squash)
	/webdata/Oracle *(rw,sync,no_root_squash)
    
	sudo exportfs -ra

## Restart NFS service
 
	systemctl restart nfs-server