# Setup ElasticSearch on Ubuntu

```bash 
ELK
E : Elasticsearch
L: LogStash
K: Kibana

Elasticsearch: Store, Search, analyze
Kibana:  Visualization and Manage
LogStash: Analysing and Transform the logs

Elasticsearch Ports:

9200  is for REST
9300 for nodes communication, discovery and transport module port.
```	
## Install Java:
```bash 
sudo apt update 
sudo apt install -y openjdk-17-jre-headless

sudo vi .bashrc
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
. .bashrc

java -version
which java
```

## Install ElasticSearch:
```bash 
sudo apt update
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
sudo echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" |  tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install elasticsearch -y 
```

## Install Kibana:
```bash 
sudo apt-get install kibana -y 
```

## Change the IP and Server URL

```bash 
uncomment below
sudo vi /etc/elasticsearch/elasticsearch.yml
	
cluster.name
network.host: 0.0.0.0
http.port: 9200 
	
sudo vi /etc/kibana/kibana.yml
	
server.port: 5601
server.host: "0.0.0.0"
```
## Restart Kibana and ElasticSearch Service
```bash
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl start kibana
sudo systemctl enable kibana
sudo systemctl restart elasticsearch
sudo systemctl restart kibana.service
```
	
## Generate an enrollment token for Kibana instance:
```bash 
sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
#Note:
Above token will help while login into elastic dashboard.
```
## Generate Kibana Token:
```bash 
cd /usr/share/kibana/bin/
./kibana-verification-code
#Note:
Above Verificatoin code will help while login into elastic dashboard.
```


## Reset elastic user pass:
```bash
cd /usr/share/elasticsearch/bin
./elasticsearch-reset-password -u elastic
#Note
Above password will help to login.
```

## Install LogStash (Optional)
```bash
sudo apt install -y logstash
sudo systemctl enable logstash
sudo systemctl start logstash
sudo systemctl status logstash
```
### Basic Logstash Test (Optional)
```bash
#Create a simple pipeline file:
sudo vi /etc/logstash/conf.d/test-pipeline.conf
#Paste this:
input {
  stdin { }
}

output {
  stdout { codec => rubydebug }
}

#Run Logstash:
sudo /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/test-pipeline.conf

```
## Connect Logstash → Elasticsearch → Kibana (Optional)
```bash
#/etc/logstash/conf.d/elk-pipeline.conf

input {
  file {
    path => "/var/log/syslog"
    start_position => "beginning"
  }
}

filter {
  grok {
    match => { "message" => "%{SYSLOGTIMESTAMP:timestamp} %{HOSTNAME:hostname} %{DATA:program}: %{GREEDYDATA:logmessage}" }
  }
}

output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "syslog-index"
  }
  stdout { codec => rubydebug }
}
# Restart Service 
sudo systemctl restart logstash
# Check Logs 
Now, in Kibana → Discover → select syslog-index to explore logs.
```



## 🔹 Elasticsearch Paths

* **Config files:**

  ```
  /etc/elasticsearch/
  ```

  * `elasticsearch.yml` → main config
  * `jvm.options` → JVM heap settings
  * `log4j2.properties` → logging config

* **Data directory (indices, shards):**

  ```
  /var/lib/elasticsearch/
  ```

* **Logs directory:**

  ```
  /var/log/elasticsearch/
  ```

* **Binary/executables:**

  ```
  /usr/share/elasticsearch/bin/
  ```

  (e.g., `elasticsearch`, `elasticsearch-plugin`)

* **Service file (systemd):**

  ```
  /lib/systemd/system/elasticsearch.service
  ```

---

## 🔹 Kibana Paths

* **Config files:**

  ```
  /etc/kibana/
  ```

  * `kibana.yml` → main config

* **Data directory (runtime data, uuid, etc.):**

  ```
  /var/lib/kibana/
  ```

* **Logs directory:**

  ```
  /var/log/kibana/
  ```

* **Binary/executables:**

  ```
  /usr/share/kibana/bin/
  ```

  (e.g., `kibana`, `kibana-plugin`)

* **Service file (systemd):**

  ```
  /lib/systemd/system/kibana.service
  ```

---

✅ So the **main ones you usually edit** are:

* `/etc/elasticsearch/elasticsearch.yml`
* `/etc/kibana/kibana.yml`

## 🔹 **Elasticsearch Commands**

### Service Management

```bash
# Start Elasticsearch
sudo systemctl start elasticsearch

# Stop Elasticsearch
sudo systemctl stop elasticsearch

# Restart Elasticsearch
sudo systemctl restart elasticsearch

# Enable on boot
sudo systemctl enable elasticsearch

# Check status
sudo systemctl status elasticsearch
```

### API Examples

```bash
# Check cluster health
curl -X GET "http://localhost:9200/_cluster/health?pretty"

# List indices
curl -X GET "http://localhost:9200/_cat/indices?v"

# Create an index
curl -X PUT "http://localhost:9200/test-index"

# Index (insert) a document
curl -X POST "http://localhost:9200/test-index/_doc/1" -H 'Content-Type: application/json' -d '{
  "name": "Laptop",
  "price": 1200
}'

# Search documents
curl -X GET "http://localhost:9200/test-index/_search?q=name:Laptop&pretty"
```

---

## 🔹 **Kibana Commands**

### Service Management

```bash
# Start Kibana
sudo systemctl start kibana

# Stop Kibana
sudo systemctl stop kibana

# Restart Kibana
sudo systemctl restart kibana

# Enable on boot
sudo systemctl enable kibana

# Check status
sudo systemctl status kibana
```

### CLI Commands

Kibana binary lives in `/usr/share/kibana/bin/`

```bash
# Check version
/usr/share/kibana/bin/kibana --version

# Run Kibana manually in foreground (for debugging)
/usr/share/kibana/bin/kibana
```

Access UI in browser: 👉 `http://localhost:5601`

---

## 🔹 **Elastic Agent Commands**

Elastic Agent is used for **Fleet & Beats replacement** (log/metrics shipping).

### Service Management

```bash
# Start Elastic Agent
sudo systemctl start elastic-agent

# Stop Elastic Agent
sudo systemctl stop elastic-agent

# Restart Elastic Agent
sudo systemctl restart elastic-agent

# Enable on boot
sudo systemctl enable elastic-agent

# Check status
sudo systemctl status elastic-agent
```

### CLI Commands

Binary: `/usr/share/elastic-agent/elastic-agent`

```bash
# Check version
/usr/share/elastic-agent/elastic-agent version

# Enroll the agent in Fleet
sudo /usr/share/elastic-agent/elastic-agent enroll \
  http://localhost:8220 \
  <ENROLLMENT_TOKEN> \
  --fleet-server-es=https://localhost:9200 \
  --fleet-server-service-token=<SERVICE_TOKEN>

# Show status
/usr/share/elastic-agent/elastic-agent status

# List running integrations
/usr/share/elastic-agent/elastic-agent inspect
```



## Inspect Cluster:
```bash

GET /_cluster/health
GET /_cluster/state
GET /_cluster/stats
GET /_cluster/settings

GET /_cat/nodes
GET /_cat/indices?v
GET /_cat/indices?v&expand_wildcards=all



curl -X GET https://192.168.1.114:9200

curl --cacert config/certs/http_ca.cert -u elastic -X GET https://localhost:9200

Sharding is a way to divide indics into smaller size
Each piece is refered as a shard
sharding is done at the index level
```	
## Ref:
```bash 
#Windows:
https://www.elastic.co/downloads/kibana
https://www.elastic.co/downloads/elasticsearch

#Centos:
https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html 
https://www.elastic.co/guide/en/kibana/current/rpm.html

#Ubuntu:
https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html
https://www.elastic.co/guide/en/kibana/current/deb.html
```