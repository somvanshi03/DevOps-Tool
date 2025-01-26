# Setup ElasticSearch on Ubuntu

## Install Java:

	apt install openjdk-17-jre-headless

	vi .bashrc
	export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
	export PATH=$JAVA_HOME/bin:$PATH
	. .bashrc

	java -version
	which java


## Install ElasticSearch:


	apt update
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
	sudo apt-get install apt-transport-https
	echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
	sudo apt-get update && sudo apt-get install elasticsearch

## Install Kibana:


	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
	sudo apt-get install apt-transport-https
	echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
	sudo apt-get update && sudo apt-get install kibana


## Generate an enrollment token for Kibana instance:

	/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

## Generate Kibana Token:

	cd /usr/share/kibana/bin/
	./kibana-verification-code



## Reset elastic user pass:


	/bin/elasticsearch-reset-password -u elastic
	
## Inspect Cluster:


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