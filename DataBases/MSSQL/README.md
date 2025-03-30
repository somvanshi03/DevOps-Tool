# Microsoft SQL Server 2019 Express Edition on Ubuntu 22.04

## Step 1: Update System Packages
		
	sudo apt update
	sudo apt upgrade -y


## Step 2: Import the Public Repository GPG Keys

	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -


## Step 3: Register the Microsoft Ubuntu Repository


	sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2019.list)"

## Step 4: Install SQL Server


	sudo apt update
	sudo apt install -y mssql-server

## Step 5: Configure SQL Server

	sudo /opt/mssql/bin/mssql-conf setup

	You will be prompted to:
	1. Choose the edition: Select `Express` (or `Developer` if you prefer).
	2. Accept the license terms.
	3. Set the SA (System Administrator) password.

## Step 6: Verify the Installation


	systemctl status mssql-server --no-pager


## Conclusion
	You have successfully installed Microsoft SQL Server 2019 Express Edition on Ubuntu 22.04. 
	You can now start creating databases and managing your SQL Server instance.