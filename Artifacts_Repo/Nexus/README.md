# Install Nexus on ubuntu 22

## 🛠 Step‑by‑Step Installation

1. **Update your system**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install Java (required by Nexus)**
   Nexus 3 requires Java 8 or later. Install OpenJDK 8:
   ```bash
   sudo apt install openjdk-8-jdk -y
   java -version
   ```

3. **Create a dedicated Nexus user**
   ```bash
   sudo adduser nexus
   sudo usermod -aG sudo nexus
   ```

4. **Download Nexus**
   ```bash
   wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.84.1-01-linux-x86_64.tar.gz
   tar -xvzf nexus-3.84.1-01-linux-x86_64.tar.gz
   sudo mkdir /opt/nexus
   sudo mv nexus-3/* /opt/nexus
   sudo mv sonatype-work /opt/sonatype-work
   ```

5. **Set permissions**
   ```bash
   sudo chown -R nexus:nexus /opt/nexus
   sudo chown -R nexus:nexus /opt/sonatype-work
   ```

6. **Configure Nexus as a service**
   Create a systemd service file:
   ```bash
   sudo vi /etc/systemd/system/nexus.service
   ```
   Add:
   ```
   [Unit]
   Description=nexus service
   After=network.target

   [Service]
   Type=forking
   LimitNOFILE=65536
   User=nexus
   Group=nexus
   ExecStart=/opt/nexus/bin/nexus start
   ExecStop=/opt/nexus/bin/nexus stop
   Restart=on-abort

   [Install]
   WantedBy=multi-user.target
   ```

   Save and exit.

7. **Enable and start Nexus**
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable nexus
   sudo systemctl start nexus
   sudo systemctl status nexus
   ```

8. **Access Nexus**
   Open your browser and go to:
   ```
   http://<your-server-ip>:8081
   ```
   Default admin password is in:
   ```
   cat /opt/sonatype-work/nexus3/admin.password
   
   ```


