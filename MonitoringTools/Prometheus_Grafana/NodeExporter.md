# Install Node Exporter on Linux

	wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
	sudo groupadd -f node_exporter
	sudo useradd -g node_exporter --no-create-home --shell /bin/false node_exporter
	sudo mkdir /etc/node_exporter
	sudo chown node_exporter:node_exporter /etc/node_exporter

	tar -xvf node_exporter-1.7.0.linux-amd64.tar.gz
	mv node_exporter-1.7.0.linux-amd64 node_exporter-files

	sudo cp node_exporter-files/node_exporter /usr/bin/
	sudo chown node_exporter:node_exporter /usr/bin/node_exporter

## Create Service

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

## Change Service mode

	chmod 664 /usr/lib/systemd/system/node_exporter.service


## Restart Service

	sudo systemctl daemon-reload
	sudo systemctl start node_exporter
	systemctl enable node_exporter.service
	sudo systemctl status node_exporter

## Access NodeExporter 

	http://<node_exporter-ip>:9200/metrics



1860
10180