# Install Opensearch on ubuntu
```bash
# OS Update
sudo apt update

# Install JRE and JDK,
apt install default-jre default-jdk vim -y 

#Export the java path to the variable JAVA_HOME,
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
echo $JAVA_HOME

# Before installing and setting up OpenSearch make sure that vm.max_map_count is set to at least 262144.

vi /etc/sysctl.conf
vm.max_map_count=262144 

# Reload to update the changes using,

sudo sysctl -p

wget https://artifacts.opensearch.org/releases/bundle/opensearch/3.3.2/opensearch-3.3.2-linux-x64.deb

sudo env OPENSEARCH_INITIAL_ADMIN_PASSWORD=S%}7sLIMmJ8Lmv8G dpkg -i opensearch-3.3.2-linux-x64.deb

# Reload and enable opensearch,

sudo systemctl daemon-reload
sudo systemctl enable opensearch
	
# Start and check the status of OpenSearch

sudo systemctl start opensearch
sudo systemctl status opensearch
	
# Curl the opensearch url running on port 9200, with username and password as admin.

curl -X GET https://localhost:9200 -u 'admin:S%}7sLIMmJ8Lmv8G' --insecure
	

vi /etc/opensearch/opensearch.yml

network.host: 0.0.0.0
discovery.type: single-node
plugins.security.disabled: false

# Restart the services
sudo systemctl restart opensearch
sudo systemctl status opensearch
```
## Install Opensearch Dashborad
```bash
# Download opensearch-dashboards
wget https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/3.3.0/opensearch-dashboards-3.3.0-linux-x64.deb
# Install opensearch-dashboards
sudo dpkg -i opensearch-dashboards-3.3.0-linux-x64.deb
# Start Service
sudo systemctl daemon-reload
sudo systemctl enable opensearch-dashboards
sudo systemctl start opensearch-dashboards
sudo systemctl status opensearch-dashboards

# Edit configuratoin
sudo vim /etc/opensearch-dashboards/opensearch_dashboards.yml


server.port: 5601
server.host: "0.0.0.0"
opensearch.hosts: ["https://0.0.0.0:9200"]
opensearch.ssl.verificationMode: none
opensearch.username: "admin"
opensearch.password: "S%}7sLIMmJ8Lmv8G"
```



