# Monitoring (Prometheus and Grafana)


## Prometheus Installation:


###	Step 1: Create Prometheus system group

			sudo groupadd --system prometheus
			sudo useradd -s /sbin/nologin --system -g prometheus prometheus

### Step 2: Create data & configs directories for Prometheus

			sudo mkdir /var/lib/prometheus
			for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done

### Step 3: Download Prometheus on Ubuntu 22.04/20.04/18.04

			sudo apt update
			sudo apt -y install wget curl vim -y 
			mkdir -p /tmp/prometheus && cd /tmp/prometheus
			curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

			tar xvf prometheus*.tar.gz
			cd prometheus*/
			sudo mv prometheus promtool /usr/local/bin/

			prometheus --version
			promtool --version

			sudo mv prometheus.yml /etc/prometheus/prometheus.yml
			sudo mv consoles/ console_libraries/ /etc/prometheus/
			cd $HOME

### Step 4: Verify prometheus.yaml file 

			sudo vim /etc/prometheus/prometheus.yml

### Step 5: Create a Prometheus systemd Service unit file

			sudo tee /etc/systemd/system/prometheus.service<<EOF
			[Unit]
			Description=Prometheus
			Documentation=https://prometheus.io/docs/introduction/overview/
			Wants=network-online.target
			After=network-online.target

			[Service]
			Type=simple
			User=prometheus
			Group=prometheus
			ExecReload=/bin/kill -HUP \$MAINPID
			ExecStart=/usr/local/bin/prometheus \
			  --config.file=/etc/prometheus/prometheus.yml \
			  --storage.tsdb.path=/var/lib/prometheus \
			  --web.console.templates=/etc/prometheus/consoles \
			  --web.console.libraries=/etc/prometheus/console_libraries \
			  --web.listen-address=0.0.0.0:9090 \
			  --web.external-url=

			SyslogIdentifier=prometheus
			Restart=always

			[Install]
			WantedBy=multi-user.target
			EOF

### Step 6: Change directory permissions.

			for i in rules rules.d files_sd; do sudo chown -R prometheus:prometheus /etc/prometheus/${i}; done
			for i in rules rules.d files_sd; do sudo chmod -R 775 /etc/prometheus/${i}; done
			sudo chown -R prometheus:prometheus /var/lib/prometheus/

### Server 7: Reload systemd daemon and start the service:

			sudo systemctl daemon-reload
			sudo systemctl start prometheus
			sudo systemctl enable prometheus


#############################################################################################################

Install Grafana:
----------------

Step 1: Update system

sudo apt update

Step 2: Add Grafana APT repository

sudo apt install -y gnupg2 curl software-properties-common
curl -fsSL https://packages.grafana.com/gpg.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/grafana.gpg
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"


Step 3: Install Grafana on Ubuntu 22.04|20.04|18.04

sudo apt update
sudo apt -y install grafana

sudo systemctl enable --now grafana-server
systemctl status grafana-server.service 

Step 4: Open Port on Firewall (Optional)

sudo apt -y install ufw
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 3000/tcp
sudo ufw allow from 192.168.50.0/24 to any port 3000

Username: admin
Password: admin


##############################################################


Install Alert Manager on Prometheus Server:
------------------------------------------------

Download Prometheus AlertManager:
-----------------------------------------
wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz

Create User:
-------------

sudo groupadd -f alertmanager
sudo useradd -g alertmanager --no-create-home --shell /bin/false alertmanager
sudo mkdir -p /etc/alertmanager/templates
sudo mkdir /var/lib/alertmanager
sudo chown alertmanager:alertmanager /etc/alertmanager
sudo chown alertmanager:alertmanager /var/lib/alertmanager

Unpack Prometheus AlertManager Binary:
----------------------------------------------

tar -xvf alertmanager-0.21.0.linux-amd64.tar.gz
mv alertmanager-0.21.0.linux-amd64 alertmanager-files



Install Prometheus AlertManager:
-------------------------------------

sudo cp alertmanager-files/alertmanager /usr/bin/
sudo cp alertmanager-files/amtool /usr/bin/
sudo chown alertmanager:alertmanager /usr/bin/alertmanager
sudo chown alertmanager:alertmanager /usr/bin/amtool


Install Prometheus AlertManager Configuration File:
---------------------------------------------------------

sudo cp alertmanager-files/alertmanager.yml /etc/alertmanager/alertmanager.yml
sudo chown alertmanager:alertmanager /etc/alertmanager/alertmanager.yml


Setup Prometheus AlertManager Service:
---------------------------------------------

sudo vi /usr/lib/systemd/system/alertmanager.service

[Unit]
Description=AlertManager
Wants=network-online.target
After=network-online.target

[Service]
User=alertmanager
Group=alertmanager
Type=simple
ExecStart=/usr/bin/alertmanager \
    --config.file /etc/alertmanager/alertmanager.yml \
    --storage.path /var/lib/alertmanager/

[Install]
WantedBy=multi-user.target


sudo chmod 664 /usr/lib/systemd/system/alertmanager.service


Reload systemd and Register Prometheus AlertManager:
-------------------------------------------------------------

sudo systemctl daemon-reload
sudo systemctl start alertmanager
sudo systemctl status alertmanager
sudo systemctl enable alertmanager.service



Access Prometheus AlertManager UI:
-----------------------------------------

http://<alertmanager-ip>:9093


Setup a Prometheus AlertManager Test Alert:
--------------------------------------------------

curl -XPOST "http://<alertmanager-ip>:9093/api/v1/alerts" \
  -d \
  "[{
    \"status\": \"firing\",
    \"labels\": {
      \"alertname\": \"Test Alert\",
      \"service\": \"test-service\",
      \"severity\":\"warning\",
      \"instance\": \"testinstance.example.com\"
    },
    \"annotations\": {
      \"summary\": \"High latency is high!\"
    }
  }]"
  
http://<alertmanager-ip>:9093

Prometheus AlertManager:
-----------------------------

global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h
  receiver: 'web.hook'
receivers:
- name: 'web.hook'
  webhook_configs:
  - url: 'http://127.0.0.1:5001/'
inhibit_rules:
  - source_match:
      severity: 'critical'
    target_match:
      severity: 'warning'
    equal: ['alertname', 'dev', 'instance']
	
sudo systemctl restart alertmanager


########################################################

groups:
  - name: custom_rules
    rules:
    - record: node_memory_MemFree_percent
      expr: 100 - (100 * node_memory_MemFree_bytes / node_memory_MemoryTotal_bytes)
    - record: node_filesystem_free_percent
      expr: 100 * node_filesystem_bytes{mount="/"} / node_filesystem_size_bytes{mountpoint="/"}
  - name: alert_rules
    rules:
      - alert: InstnaceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summuary: "Instance [{{ $labels.instnace }}] down"
          decription: "Instance [{{ $labels.instnace }}] of job [{{ $labels.job }}] has been down for more then 1 minute."
      - alert: DiskSpaceFree10Percent
        expr: node_filesystem_Free_percent <= 10
        labels:
          severity: critical
        annotations:
          summary: "Instance [{{ $labels.instance }}] has 10% or less Free disk space"
          description: "[{{ $labels.instance }}] has only {{ $value }}% or less free "
      - alert: HostHighCpuLoad
        expr: 100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
        for: 30s
        labels:
          severity: warning
        annotations:
          description: "CPU load is > 80% VALUE = {{ humanize $value }} LABELS: {{ $labels }}"
          summary: "Host high CPU load (instance {{ $labels.instance }})"
      - alert: HostOutOfMemory
        expr: node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 20
        for: 30s
        labels:
          severity: warning
        annotations:
          description: "Node memory is filling up (< 20% left) VALUE = {{ humanize $value }} LABELS: {{ $labels }}"
          summary: "Host out of memory (instance {{ $labels.instance }})"
      
-------------------------------------------------------------------------------------
prometheus@prometheus:~$ promtool check rules /etc/prometheus/alert_rules.yaml
Checking /etc/prometheus/alert_rules.yaml
  SUCCESS: 3 rules found

systemctl restart prometheus 


#############################################################




wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
sudo groupadd -f node_exporter
sudo useradd -g node_exporter --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/node_exporter
sudo chown node_exporter:node_exporter /etc/node_exporter

tar -xvf node_exporter-1.7.0.linux-amd64.tar.gz
mv node_exporter-1.7.0.linux-amd64 node_exporter-files

sudo cp node_exporter-files/node_exporter /usr/bin/
sudo chown node_exporter:node_exporter /usr/bin/node_exporter

vi /usr/lib/systemd/system/node_exporter.service

[Unit]
Description=Node Exporter
Documentation=https://prometheus.io/docs/guides/node-exporter/
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
ExecStart=/usr/bin/node_exporter \
  --web.listen-address=:9200

[Install]
WantedBy=multi-user.target

chmod 664 /usr/lib/systemd/system/node_exporter.service

sudo systemctl daemon-reload
sudo systemctl start node_exporter
systemctl enable node_exporter.service
sudo systemctl status node_exporter

http://<node_exporter-ip>:9200/metrics



1860
10180