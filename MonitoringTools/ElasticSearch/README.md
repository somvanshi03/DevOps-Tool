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
sudo apt install openjdk-17-jre-headless

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
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
sudo echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" |  tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install kibana -y 
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
```
	
## Generate an enrollment token for Kibana instance:
```bash 
sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
#Note:
Above token will help while login into elastic dashboard.
```
## Generate Kibana Token:
```bash 
sudo cd /usr/share/kibana/bin/
sudo ./kibana-verification-code
#Note:
Above Verificatoin code will help while login into elastic dashboard.
```


## Reset elastic user pass:
```bash
cd /usr/share/elasticsearch/bin
sudo /bin/elasticsearch-reset-password -u elastic
#Note
Above password will help to login.
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