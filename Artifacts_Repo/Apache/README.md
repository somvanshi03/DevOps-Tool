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
sudo wget https://downloads.apache.org/archiva/2.2.10/binaries/apache-archiva-2.2.10-bin.tar.gz
```

(Verify URL; mirrored sites might differ.)



## 4. Extract and install

```bash
cd /opt
sudo tar xzvf apache-archiva-2.2.10-bin.tar.gz
sudo mv apache-archiva-2.2.10 archiva
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

## 5. Configure Archiva

* In the Archiva folder, there is a `conf/jetty.xml` (or similar) where you can set the HTTP port (default 8080). ([Oracle Docs][1])
* Adjust memory or Java options in `bin/archiva` or `bin/archiva-env.sh` (if present).
* You may want to configure base URLs, repositories (internal, snapshots), users, etc., via the web admin once it’s running. ([Oracle Docs][1])



## 6. Start Archiva

Switch to the archiva user (if you created one) or run directly:

```bash
cd /opt/archiva/bin
sudo -u archiva ./archiva start
```

Or, if not using a special user:

```bash
./archiva start
```

You can also run in console mode (foreground) with:

```bash
./archiva console
```

This will keep logs on stdout. 

Check logs:

```bash
tail -f ../logs/*.log
```


## 7. Access the Web UI

Open a browser and navigate to:

```
http://<your-server-ip>:8080/
```

You’ll be prompted to set up the admin user, set password, etc. 

By default, Archiva provides two repositories:

* `internal` (for released artifacts, proxying Maven Central) 
* `snapshots` for in‑progress snapshot artifacts. 

---

## 8. (Optional) Run as a systemd service

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
```




