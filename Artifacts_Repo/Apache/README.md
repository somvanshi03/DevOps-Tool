## Apache archiva 

## 1. Prerequisites

* You’ll need **Java (JDK 8 or above, typically 1.8 is recommended for older Archiva versions)**. 
* Ensure you have sufficient permissions (use `sudo` or root).
* Make sure your system is updated:

```bash
sudo apt update
sudo apt upgrade -y
```

## 2. Install Java

If Java is not installed:

```bash
sudo apt install openjdk-8-jdk -y
```

You can check with:

```bash
java -version
```

If you want a newer Java (e.g. 11 or 17), you can install that instead—but be sure the Archiva version supports it.



## 3. Download Archiva

Go to the official Apache Archiva download page. 
Choose the standalone binary `.tar.gz` package, for example: `apache-archiva-2.2.10-bin.tar.gz`. 

You can use `wget` (example):

```bash
cd /opt
sudo wget https://archive.apache.org/dist/archiva/2.2.9/binaries/apache-archiva-2.2.9-bin.tar.gz
```

(Verify URL; mirrored sites might differ.)



## 4. Extract and install

```bash
cd /opt
sudo tar xzvf apache-archiva-2*
sudo rm -rf apache-archiva-2.2.9-bin.tar.gz
sudo mv apache-archiva-2* archiva
```

You might want to standardize the path, e.g.:

```bash
sudo ln -s /opt/archiva /opt/apache-archiva
```

Change ownership if you plan to run Archiva under a specific user (e.g. `archiva`):

```bash
sudo useradd -r -m archiva
sudo chown -R archiva:archiva /opt/archiva
```


## 5. (Optional) Run as a systemd service

To make Archiva start on boot, you can create a `service` file under `/etc/systemd/system/archiva.service`. Example:

```
[Unit]
Description=Apache Archiva
After=network.target

[Service]
Type=forking
User=archiva
Group=archiva
ExecStart=/opt/archiva/bin/archiva start
ExecStop=/opt/archiva/bin/archiva stop
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Reload systemd:

```bash
sudo systemctl daemon-reload
sudo systemctl enable archiva
sudo systemctl start archiva
sudo systemctl status archiva
```
## Access apache UI
```bash
ss -tnlp

<ip:8080>
```




