# Bamboo Setup on Ubuntu 

	https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-10.2.0.tar.gz 



	To install **Bamboo CI** (which is a continuous integration and deployment server from Atlassian) on **Ubuntu 22.04**, follow these steps:

### **Prerequisites**
	1. A fresh or updated Ubuntu 22.04 server or machine.
	2. Java 8 or later (Bamboo requires Java).
	3. At least 4GB of RAM and 2 CPU cores are recommended.
	4. A working internet connection.

## Install Bamboo CI on Ubuntu 22.04**



### **Step 1: Install Java Development Kit (JDK)**

	Bamboo requires **Java** to run. Make sure to install a supported version of the JDK, such as OpenJDK 11 or 17.

	1. **Install OpenJDK 11** (or any other supported version):


	   sudo apt update && sudo apt upgrade -y
	   sudo apt install openjdk-11-jdk -y


	2. **Verify the installation**:


	   java -version


	   You should see output like:


	   openjdk version "11.0.x" 202x-xx-xx
	   OpenJDK Runtime Environment (build 11.0.x+xx)
	   OpenJDK 64-Bit Server VM (build 11.0.x+xx, mixed mode)




	### **Step 2: Download Bamboo CI Installation Files**

	1. Go to the [Bamboo download page](https://www.atlassian.com/software/bamboo/download) and find the latest version.

	2. Alternatively, you can directly download the .tar.gz file from Atlassian’s repository using `wget`:


	cd /opt
	sudo wget https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-10.2.0.tar.gz 
   

   *(Make sure to replace "8.x.x" with the actual latest version number.)*



### **Step 3: Extract Bamboo Files**

	1. Extract the Bamboo tar file you just downloaded:


		sudo tar -xvzf atlassian-bamboo-10.2.0.tar.gz
   

	2. Move the extracted folder to a more appropriate directory (like `/opt/`):

   
		sudo mv atlassian-bamboo-10.2.0 /opt/bamboo
   



### **Step 4: Set Up Bamboo as a Service**

	1. Create a user for Bamboo if you don't want to run it as root:

   
		   sudo useradd -m bamboo
		   sudo chown -R bamboo:bamboo /opt/bamboo
   

	2. Create a Bamboo systemd service file:

   
		sudo vi /etc/systemd/system/bamboo.service
   

	3. Paste the following into the file:


	   [Unit]
	   Description=Bamboo CI Server
	   After=network.target

	   [Service]
	   Type=forking
	   User=bamboo
	   Group=bamboo
	   ExecStart=/opt/bamboo/bin/start-bamboo.sh
	   ExecStop=/opt/bamboo/bin/stop-bamboo.sh
	   Restart=always
	   Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"

	   [Install]
	   WantedBy=multi-user.target
 

   **Note:** If you're using a different version of Java, update the `JAVA_HOME` path accordingly.

	4. Save and close the editor (Ctrl + X, then Y to confirm).

	5. Reload systemd and start Bamboo:


		   sudo systemctl daemon-reload
		   sudo systemctl start bamboo


	6. Enable Bamboo to start on boot:

 
		sudo systemctl enable bamboo
 

	

### **Step 5: Access Bamboo Web Interface**

	1. Open your web browser and navigate to `http://<your-server-ip>:8085` to access the Bamboo web interface.

	2. Follow the on-screen instructions to complete the setup process (e.g., license key, database configuration).



### **Step 6: Configure Firewall (if applicable)**

	If you are running a firewall on your Ubuntu machine, you may need to allow traffic on port 8085 (default for Bamboo):


		sudo ufw allow 8085/tcp
		sudo ufw reload


### **Step 7: Optional - Set Up a Reverse Proxy (Nginx/Apache)**

		If you prefer to use a custom domain or port for Bamboo, you can set up a reverse proxy using **Nginx** or **Apache**.

		For example, if you're using **Nginx**:

	1. Install Nginx:


		sudo apt install nginx -y


	2. Configure the reverse proxy by editing Nginx config:


		sudo vi /etc/nginx/sites-available/bamboo


	3. Add the following:


		   server {
			   listen 80;
			   server_name bamboo.yourdomain.com;

			   location / {
				   proxy_pass http://localhost:8085;
				   proxy_set_header Host $host;
				   proxy_set_header X-Real-IP $remote_addr;
				   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				   proxy_set_header X-Forwarded-Proto $scheme;
			   }
		   }


	4. Enable the configuration:


		sudo ln -s /etc/nginx/sites-available/bamboo /etc/nginx/sites-enabled/
		sudo systemctl restart nginx


	

### **Conclusion**

	You’ve successfully installed **Bamboo CI** on your Ubuntu 22.04 server. You can now start configuring Bamboo for your Continuous Integration and Continuous Deployment pipelines!