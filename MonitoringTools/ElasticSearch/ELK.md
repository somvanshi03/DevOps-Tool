## To install **Elasticsearch**, **Kibana**, and **Logstash** 

### 🔧 Prerequisites

Run everything as a user with `sudo` privileges. Make sure Ubuntu is up to date:

```bash
sudo apt update && sudo apt upgrade -y
```

Install required dependencies:

```bash
sudo apt install apt-transport-https ca-certificates curl gnupg -y
```

---

## 🧩 1. Add Elastic Stack APT Repository

### Import the GPG key:

```bash
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic-keyring.gpg
```

### Add the repository:

```bash
echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
```

Update package lists:

```bash
sudo apt update
```

---

## 🔍 2. Install Elasticsearch

```bash
sudo apt install elasticsearch -y
```

Enable and start Elasticsearch:

```bash
sudo systemctl enable --now elasticsearch
```

Check status:

```bash
sudo systemctl status elasticsearch
```

Elasticsearch may take 30 seconds to start. Confirm it's running:

```bash
curl -k https://localhost:9200 -u elastic
```

> First-time access will prompt for a password. Elastic will generate a default one and store it in:
>
> ```
> /etc/elasticsearch/elasticsearch.keystore
> ```

You can also run:

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```

---

## 📊 3. Install Kibana

```bash
sudo apt install kibana -y
```

Enable and start Kibana:

```bash
sudo systemctl enable --now kibana
```

Kibana runs on port **5601**. You can access it via:

```
http://localhost:5601
```

To allow remote access, edit Kibana config:

```bash
sudo nano /etc/kibana/kibana.yml
```

Uncomment and set:

```yaml
server.host: "0.0.0.0"
```

Then restart Kibana:

```bash
sudo systemctl restart kibana
```

---

## 📦 4. Install Logstash

```bash
sudo apt install logstash -y
```

Start and enable Logstash:

```bash
sudo systemctl enable --now logstash
```

Check status:

```bash
sudo systemctl status logstash
```

---

## 🛡️ 5. Firewall (Optional)

If using UFW (Uncomplicated Firewall):

```bash
sudo ufw allow 9200/tcp    # Elasticsearch
sudo ufw allow 5601/tcp    # Kibana
```

---

## ✅ Verify Installation

* Elasticsearch: `curl -u elastic https://localhost:9200 --insecure`
* Kibana: Visit `http://your-server-ip:5601`
* Logstash: Check with `sudo systemctl status logstash`

---

## 🔐 Notes on Security (Elastic 8.x+)

Elastic 8.x enables security by default:

* TLS between nodes
* Authentication enabled (basic auth)
* Certificates auto-generated

You’ll get temporary passwords after install in:

```bash
/var/lib/elasticsearch
```

Or you can reset passwords with:

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```


