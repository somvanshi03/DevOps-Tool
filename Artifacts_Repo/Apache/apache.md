# Setup Apache Archiva

	sudo apt update
	sudo apt install openjdk-11-jdk -y 
	java -version
	wget https://archive.apache.org/dist/archiva/2.2.8/binaries/apache-archiva-2.2.8-bin.tar.gz
	tar -xzvf apache-archiva-2.2.8-bin.tar.gz
	sudo mv apache-archiva-2.2.8 /opt/archiva
	sudo chown -R archiva:archiva /opt/archiva

	sudo vi /etc/systemd/system/archiva.service

	[Unit]
	Description=Apache Archiva Repository Manager
	After=network.target

	[Service]
	Type=forking
	ExecStart=/opt/archiva/bin/archiva start
	ExecStop=/opt/archiva/bin/archiva stop
	User=$USER
	Group=$USER
	Restart=on-failure
	WorkingDirectory=/opt/archiva

	[Install]
	WantedBy=multi-user.target

	sudo useradd -r -d /opt/archiva -s /bin/false archiva
	sudo chown -R archiva. /opt/archiva
	

	sudo systemctl daemon-reload
	sudo systemctl enable archiva
	sudo systemctl start archiva


	http://<your-server-ip>:8080
