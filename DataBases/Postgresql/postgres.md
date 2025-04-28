# Postgres on Ubuntu:

## Install dependency

	apt update 
	sudo apt install software-properties-common apt-transport-https wget -y
	sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

## Install Postgres

	sudo apt  update
	sudo apt  -y install postgresql
	sudo apt -y install postgresql-13 postgresql-13-pgqr postgresql-13-cron postgresql-13-postgis-3

## Check Postgres Status and Enable services

	sudo systemctl status postgresql
	sudo systemctl enable postgresql

## Create DB

	sudo -u postgres psql
	SELECT version();
	ALTER USER postgres PASSWORD 'postgres';

## Exit from DB

	\q
	exit ()


## Check Status DB
	
	ss -nlt

## Change DB parameter to access outside of server

	sudo vi /etc/postgresql/13/main/postgresql.conf
	#listen_addresses = 'localhost' 
	listen_addresses = '*' 

	sudo systemctl restart postgresql


	ss -nlt
	sudo vi /etc/postgresql/13/main/pg_hba.conf 
	
	host    all          all            0.0.0.0/0  md5
	host    replication     all         0.0.0.0/0           md5

	sudo systemctl restart postgresql

## DB Extention

	CREATE EXTENSION postgis;
	CREATE EXTENSION tablefunc;
	CREATE EXTENSION postgis_topology CASCADE;
	CREATE EXTENSION pg_cron;
	CREATE EXTENSION plpython3u; 
	CREATE EXTENSION dblink;
	CREATE EXTENSION pg_trgm;
	CREATE EXTENSION cube;
	CREATE EXTENSION citext;
	CREATE extension earthdistance;

## DB Backup and Export 

### Postgresql Export and Import Command

	## Linux
	
	Execute the below commmand as postgres user
	Export Script:

	pg_dump --file "/data/postgresql/13/main/backup/abc_20211014_v1.tar" --host localhost --port "5432" --username abc --verbose --format=t --blobs --dbname="abcdb"

	Import script

	pg_restore --host localhost --port 5432 --username "abc" --dbname "abcdb" --verbose "/data/postgresql/13/main/backup/abc_20210701_v1.tar"
	
	### Windows
	
	"C:\Program Files\PostgreSQL\14\bin\pg_dump.exe" --file "D:\postgresBackup\DB_20240503.tar" --host localhost --port "5432" --username user --verbose --format=t --blobs --dbname="DB"
	
	"C:\Program Files\PostgreSQL\14\bin\pg_restore.exe" --host localhost --port 5432 --username "user" --dbname "DB" --verbose "D:\postgresBackup\DB_20240503.tar"
	
	## Sudo permission
	
	dba ALL=(ALL) NOPASSWD: /bin/systemctl start postgresql, /bin/systemctl stop postgresql, /bin/systemctl restart postgresql, /usr/bin/pg_dump, /usr/bin/pg_restore