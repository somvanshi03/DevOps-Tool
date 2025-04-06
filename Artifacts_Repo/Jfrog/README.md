# Jfrog Setup on Ubuntu:22.04

## Step 1: Update the System

	First, ensure your system is up to date:


	sudo apt update
	sudo apt upgrade -y


## Step 2: Install Java

	JFrog Artifactory requires Java to run. Install OpenJDK 11:


	sudo apt install openjdk-11-jdk -y


	Verify the installation:


	java -version


## Step 3: Download and Install JFrog Artifactory

	1. **Download the Artifactory package:**

	   You can download the latest version of JFrog Artifactory from the official website or use the following command to download it directly:
	   
	   wget https://releases.jfrog.io/artifactory/artifactory-pro/org/artifactory/pro/jfrog-artifactory-pro/7.9.1/jfrog-artifactory-pro-7.9.1-linux.tar.gz
	  

	   Replace `[VERSION]` with the specific version number you want to install.

	2. **Extract the package:**

	   
	   tar -xvf jfrog-artifactory-pro-7.9.1-linux.tar.gz
	  

	3. **Move the extracted folder to `/opt`:**

	   
	   sudo mv artifactory-pro-7.9.1 /opt/jfrog-artifactory
	 

## Step 4: Configure Artifactory

	1. **Create a systemd service file:**

	   Create a new service file for Artifactory:

	   
	   sudo nano /etc/systemd/system/artifactory.service
	   

	   Add the following content:

	   
	   [Unit]
	   Description=JFrog Artifactory
	   After=network.target

	   [Service]
	   Type=forking
	   ExecStart=/opt/jfrog-artifactory/app/bin/artifactoryctl start
	   ExecStop=/opt/jfrog-artifactory/app/bin/artifactoryctl stop
	   User=artifactory
	   Group=artifactory
	   Restart=always

	   [Install]
	   WantedBy=multi-user.target
	   

	2. **Create the `artifactory` user:**

	   
	   sudo useradd -r -s /bin/false artifactory
	  

	3. **Set ownership of the Artifactory directory:**

	  
	   sudo chown -R artifactory:artifactory /opt/jfrog-artifactory
	   

	4. **Reload systemd and start the service:**

	   
	   sudo systemctl daemon-reload
	   sudo systemctl start artifactory
	   sudo systemctl enable artifactory
   

## Step 5: Access Artifactory

	1. **Open the firewall (if necessary):**

	   If you have a firewall enabled, allow port 8081:

	 
	   sudo ufw allow 8081/tcp
	   

	2. **Access Artifactory in your browser:**

	   Open your web browser and navigate to:

	   
	   http://<your-server-ip>:8081
	   

	   The default credentials are:
	   - **Username:** admin
	   - **Password:** password

## Step 6: Configure Artifactory (Optional)

	1. **Change the default password:**

	   After logging in, it is highly recommended to change the default password.

	2. **Configure Artifactory:**

	   You can configure repositories, users, permissions, and other settings through the Artifactory web interface.

## Step 7: Backup and Maintenance

	1. **Backup:**

	   Regularly back up your Artifactory data. The data is stored in `/opt/jfrog-artifactory/var`.

	2. **Maintenance:**

	   Monitor the system logs and Artifactory logs for any issues. Logs can be found in `/opt/jfrog-artifactory/var/log`.

## Conclusion

	You have successfully installed and configured JFrog Artifactory on Ubuntu 22.04. 
	You can now start using Artifactory to manage your artifacts, dependencies, and builds.