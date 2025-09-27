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
	apt install openjdk-17-jre-headless

	vi .bashrc
	export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
	export PATH=$JAVA_HOME/bin:$PATH
	. .bashrc

	java -version
	which java
```

## Install ElasticSearch:
```bash 

	apt update
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
	sudo apt-get install apt-transport-https
	echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
	sudo apt-get update && sudo apt-get install elasticsearch
```

## Install Kibana:
```bash 
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
	sudo apt-get install apt-transport-https
	echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
	sudo apt-get update && sudo apt-get install kibana
```

## Change the IP and Server URL

```bash 
	uncomment below
	vi /etc/elasticsearch/elasticsearch.yaml
	
	cluster.name
	network.host: 0.0.0.0
	http.port: 9200 
	
	vi /etc/kibana/kibana.yaml
	
	server.port: 5601
	server.host: "0.0.0.0"
```
## Restart Kibana and ElasticSearch Service
```bash
	systemctl start elasticsearch
	systemctl enable elasticsearch
	systemctl start kibana
	systemctl enable kibana
```
	
## Generate an enrollment token for Kibana instance:
```bash 
	/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```
## Generate Kibana Token:
```bash 
	cd /usr/share/kibana/bin/
	./kibana-verification-code
```


## Reset elastic user pass:
```bash

	/bin/elasticsearch-reset-password -u elastic
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
	Windows:
	https://www.elastic.co/downloads/kibana
	https://www.elastic.co/downloads/elasticsearch

	Centos:
	https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html 
	https://www.elastic.co/guide/en/kibana/current/rpm.html

	Ubuntu:
	https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html
	https://www.elastic.co/guide/en/kibana/current/deb.html
```