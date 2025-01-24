# Nexus Setup on Ubuntu

### Prerequisites:

	- **Ubuntu 20.04** or later.
	- **Java 8** or higher installed (Nexus requires Java).
	- **Root or sudo access** to install packages and configure the system.

### Step 1: Install Java
	Nexus Repository Manager requires Java to run. You can install OpenJDK 11 or OpenJDK 17 (which are supported).

	Run the following commands to install OpenJDK:


	sudo apt update
	sudo apt upgrade -y
	sudo apt install openjdk-11-jdk -y


	Check the Java installation:


	java -version


	It should output the version of Java installed.

### Step 2: Create a Nexus User
	
	For security purposes, it’s a good practice to create a dedicated user for running Nexus.

	sudo useradd -r -m -d /opt/nexus -s /bin/bash nexus
	sudo passwd nexus

	This will create a user named `nexus` and set the home directory to `/opt/nexus`.

### Step 3: Download Nexus Repository Manager

	Go to the official Sonatype Nexus download page or use `wget` to download the latest version of Nexus Repository Manager.

	vi /etc/security/limits.d/nexus.conf 
	
	nexus soft nofile 65536
	nexus hard nofile 65536 
	
	cd /opt
	sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz


	Extract the archive:


	sudo tar -xvzf latest-unix.tar.gz


	This will create a directory called `nexus-3.x.x-xx`.

### Step 4: Set Permissions

	Set the correct permissions for the extracted Nexus files:

	sudo chown -R nexus:nexus /opt/nexus-3*


### Step 5: Configure Nexus as a Service

	vi /opt/nexus/bin/nexus.rc
	
	run_as_user="nexus"

	To run Nexus as a service, we need to create a systemd service file.

	Create a new service file for Nexus:

	sudo vi /etc/systemd/system/nexus.service

	Add the following content to the file:


	[Unit]
	Description=Nexus Repository Manager
	Documentation=http://help.sonatype.com/
	After=network.target

	[Service]
	Type=forking
	User=nexus
	ExecStart=/opt/nexus-3.x.x-xx/bin/nexus start
	ExecStop=/opt/nexus-3.x.x-xx/bin/nexus stop
	Restart=always
	LimitNOFILE=65536
	LimitNPROC=4096
	LimitCORE=infinity
	TimeoutSec=300

	[Install]
	WantedBy=multi-user.target


	

### Step 6: Start and Enable Nexus

	Now, reload systemd to recognize the new Nexus service and start it.

	
	sudo systemctl daemon-reload
	sudo systemctl start nexus
	sudo systemctl enable nexus


### Step 7: Open Nexus in the Browser

	By default, Nexus Repository Manager listens on port `8081`. Open your web browser and navigate to:


	http://<your-server-ip>:8081
	

	The first time you access Nexus, you will be prompted to enter the **Admin Password**. You can find the default password by checking the following file:

	
	cat /opt/nexus-3.x.x-xx/admin.password
	

	Copy the password and use it to log in.

### Step 8: Configure Nexus
	
	- Once logged in, you can begin configuring your Nexus Repository Manager by creating repositories for different formats (Maven, npm, Docker, etc.).
	- You can also manage users, permissions, and security settings through the web interface.

### Step 9: (Optional) Adjust Firewall Rules

	If you have a firewall enabled, allow traffic to port 8081:


	sudo ufw allow 8081


### Step 10: (Optional) Configure Nexus to Use a Specific Port

	If you want to change the default port (8081), edit the `nexus.properties` file:


	sudo nano /opt/nexus-3.x.x-xx/etc/nexus.properties


	Look for the following line:


	application-port=8081


	Change `8081` to your desired port and save the file.

	Then restart Nexus:

	
	sudo systemctl restart nexus
	

### Troubleshooting

	If Nexus is not starting correctly or the service fails, check the logs:

	sudo tail -f /opt/nexus-3.x.x-xx/log/nexus.log
	

### Conclusion

	That's it! You've successfully set up Nexus Repository Manager on your Ubuntu machine. You can now use it to manage artifacts, proxy remote repositories, and host your custom software libraries.