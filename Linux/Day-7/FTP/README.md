# FTP on Ubuntu

## Install OS Update and Upgrade

	sudo apt update -y
	sudo apt upgrade -y
	
## Install VSFTP Package

	sudo apt install vsftpd -y
	
## Change vsftpd.conf file

	Uncomment below parameters
	
	listen=NO
	anonymous_enable=NO
	write_enable=YES
	local_enable=YES
	chroot_local_user=YES
	chroot_list_enable=YES

## Add below parameters in the end of conf file

	user_sub_token=$USER
	local_root=/home/$USER/ftp
	userlist_enable=YES
	userlist_file=/etc/vsftpd.userlist
	userlist_deny=NO
	
	echo "ubuntu" | sudo tee -a /etc/vsftpd.userlist
	
## Change permission

	mkdir /home/ubuntu/ftp
	mkdir /home/ubuntu/ftp/upload
    chmod a-w /home/ubuntu/ftp
	chown ubuntu. /home/ubuntu/ftp/upload/

## Restart VSFTP Service

	systemctl restart vsftpd.service 
	
## Create new user and add ftp and upload dir and provide same permission.


	mkdir /home/user1/ftp
	mkdir /home/user1/ftp/upload
    chmod a-w /home/user1/ftp
	chown ubuntu. /home/user1/ftp/upload/
	
	echo "user1" | sudo tee -a /etc/vsftpd.userlist
	
## Restart VSFTP Service

	systemctl restart vsftpd.service 
	
## Note

	User1 can not access to Ubuntu dir and Ubuntu user can not access user1 dir.
	

## SSL Connection

	sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

	allow_anon_ssl=NO
	force_local_data_ssl=YES
	force_local_logins_ssl=YES