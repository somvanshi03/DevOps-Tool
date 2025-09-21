# Install JFrog Artifactory on Ubuntu 24.04 LTS

### Prerequisites

	- Ubuntu 22.04 system with sudo privileges.
	- Internet access for repository and package downloads.

### Steps to Install JFrog Artifactory

1. **Install Java JDK**  
   Artifactory requires Java. Install it using:  
   ```bash
   sudo apt update
   sudo apt install openjdk-8-jdk -y
   java -version
   ```
   This should install the default OpenJDK (version 11 or newer is typically fine).[2][4]

2. **Add JFrog Artifactory APT Repository**
   ```bash
   sudo wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
   sudo apt install unzip -y
   sudo unzip -o jfrog-artifactory-oss-6.9.6.zip -d /opt/
   sudo mv /opt/artifactory-oss-6.9.6 /opt/jfrog
   ./bin/artifactory.sh start
   ```


3. **Create Artifactory Service**

```t 
# Artifactory Service 

sudo vi /etc/systemd/system/artifactory.service

[Unit]
Description=Artifactory service
After=network.target

[Service]
Type=forking
User=artifactory
Group=artifactory
ExecStart=/opt/jfrog/bin/artifactory.sh start
ExecStop=/opt/jfrog/bin/artifactory.sh stop
ExecReload=/opt/jfrog/bin/artifactory.sh restart
PIDFile=/opt/jfrog/artifactory/app/var/artifactory.pid
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```


4. **Enable and Start Artifactory Service**
   ```bash
    sudo systemctl daemon-reload
	sudo systemctl enable artifactory
	sudo systemctl start artifactory
	sudo systemctl status artifactory 
	```

5. **Access Artifactory Web Interface**
   ```bash
   http://<your-server-ip>:8081
   ```



 