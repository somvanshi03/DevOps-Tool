# Monitoring (Prometheus and Grafana)

## Install Alert Manager on Prometheus Server:


### Download Prometheus AlertManager:

			wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz

### Create User:


			sudo groupadd -f alertmanager
			sudo useradd -g alertmanager --no-create-home --shell /bin/false alertmanager
			sudo mkdir -p /etc/alertmanager/templates
			sudo mkdir /var/lib/alertmanager
			sudo chown alertmanager:alertmanager /etc/alertmanager
			sudo chown alertmanager:alertmanager /var/lib/alertmanager

### Unpack Prometheus AlertManager Binary:


			tar -xvf alertmanager-0.21.0.linux-amd64.tar.gz
			mv alertmanager-0.21.0.linux-amd64 alertmanager-files



### Install Prometheus AlertManager:


			sudo cp alertmanager-files/alertmanager /usr/bin/
			sudo cp alertmanager-files/amtool /usr/bin/
			sudo chown alertmanager:alertmanager /usr/bin/alertmanager
			sudo chown alertmanager:alertmanager /usr/bin/amtool


### Install Prometheus AlertManager Configuration File:


			sudo cp alertmanager-files/alertmanager.yml /etc/alertmanager/alertmanager.yml
			sudo chown alertmanager:alertmanager /etc/alertmanager/alertmanager.yml


### Setup Prometheus AlertManager Service:


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

### Change Service mod
			
			sudo chmod 664 /usr/lib/systemd/system/alertmanager.service


### Reload systemd and Register Prometheus AlertManager:


			sudo systemctl daemon-reload
			sudo systemctl start alertmanager
			sudo systemctl status alertmanager
			sudo systemctl enable alertmanager.service



### Access Prometheus AlertManager UI:


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