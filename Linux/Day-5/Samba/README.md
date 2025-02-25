# Setup Samba on ubuntu

## Update OS

	sudo apt update

## Install samba Package

	sudo apt install samba -y

## Create New Dir to Share

	mkdir mynewshare 
	cd mynewshare
	pwd 

## Edit smb.conf file

	vi /etc/samba/smb.conf
	
	[mynewshare]
		comment =  Samba on Ubuntu
		path = /home/user11/mynewshare
		read only = no 
		browsable = yes

## Restart Services

	service smbd start

## Add user to samba

	sudo smbpasswd -a user11 

## Mount samba drive to windows machine
	 
	now mount this samba on windows machine
	\\IP\ShareName

## Change permission on SambaDrive

	chmod 777 /home/user11/mynewshare
	