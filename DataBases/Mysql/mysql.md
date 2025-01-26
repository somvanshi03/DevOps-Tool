# Install mysql on ubuntu 22.04

	sudo apt update
	sudo apt install mysql-server -y 
	mysqld –version 
	sudo systemctl start mysql.service
	sudo ss -tap | grep mysql

	sudo mysql_secure_installation
	===============================
	sudo mysql -u root
	sudo mysql
	create database wpdwptest;
	show databases;

	CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'fVMXH#';
	GRANT ALL PRIVILEGES ON dwpcaresdb.* TO 'dbuser'@'localhost';
	FLUSH PRIVILEGES;