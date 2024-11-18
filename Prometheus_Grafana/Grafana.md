# Monitoring (Prometheus and Grafana)

## Install Grafana:


### Step 1: Update system

			sudo apt update

### Step 2: Add Grafana APT repository

			sudo apt install -y gnupg2 curl software-properties-common
			curl -fsSL https://packages.grafana.com/gpg.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/grafana.gpg
			sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"


### Step 3: Install Grafana on Ubuntu 22.04|20.04|18.04

			sudo apt update
			sudo apt -y install grafana

			sudo systemctl enable --now grafana-server
			systemctl status grafana-server.service 

### Step 4: Open Port on Firewall (Optional)

			sudo apt -y install ufw
			sudo ufw enable
			sudo ufw allow ssh
			sudo ufw allow 3000/tcp
			sudo ufw allow from 192.168.50.0/24 to any port 3000
		
### Step 5: Default Username and Password
			Username: admin
			Password: admin