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

	mkdir /home/nfsadmin/myshare
	
    sudo vi /etc/exports
	
	/home/nfsadmin/myshare *(rw,sync,no_subtree_check,no_root_squash)
	
    
	sudo exportfs -ra

	
## Mount NFS on Clint VM

	
	mkdir /myshare 
	mount -t nfs 10.0.0.4:/home/nfsadmin/myshare /myshare
	 
	 df -hT 

## Permanent Mount in FSTAB

	vi /etc/fstab 
	
	10.0.0.4:/home/demouser/myshare  /myshare  nfs  defaults  0  0