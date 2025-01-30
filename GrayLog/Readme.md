sudo apt update -y
sudo apt upgrade -y

sudo apt install apt-transport-https gnupg2 uuid-runtime pwgen curl dirmngr -y

sudo apt install openjdk-11-jre-headless -y

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update -y
sudo apt install -y mongodb-org

sudo systemctl enable --now mongod
sudo systemctl status mongod

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch-oss -y

sudo nano /etc/elasticsearch/elasticsearch.yml

cluster.name: graylog
action.auto_create_index: false

sudo systemctl daemon-reload
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

wget https://packages.graylog2.org/repo/packages/graylog-4.3-repository_latest.deb
sudo dpkg -i graylog-4.3-repository_latest.deb
sudo apt update -y
sudo apt install graylog-server -y

pwgen -N 1 -s 96
echo -n "Enter Password: " && head -1

sudo nano /etc/graylog/server/server.conf

password_secret = your_generated_secret
root_password_sha2 = your_generated_password
http_bind_address = 0.0.0.0:9000

sudo systemctl daemon-reload
sudo systemctl start graylog-server
sudo systemctl enable graylog-server

sudo systemctl status graylog-server


sudo apt install nginx -y

sudo nano /etc/nginx/sites-available/graylog.conf

server {
    listen 80;
    server_name graylog.example.com;

    location / {
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Graylog-Server-URL http://$server_name/;
        proxy_pass http://localhost:9000;
    }
}

sudo ln -s /etc/nginx/sites-available/graylog.conf /etc/nginx/sites-enabled/
sudo systemctl restart nginx

http://graylog.example.com
``