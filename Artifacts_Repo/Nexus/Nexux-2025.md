# Setup Nexus on Ubuntu

## Login as a root user
```bash
sudo su -
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-unix-x86-64-3.78.0-14.tar.gz
tar -xvf nexus-unix-x86-64-3.78.0-14.tar.gz
mv nexus-3.78.0-14 nexus

#As a good security practice, Nexus is not advised to run nexus service as a root user, so create a new user called nexus and grant sudo access to manage nexus services as follows.
 
useradd nexus

#Give the sudo access to nexus user

visudo
nexus ALL=(ALL) NOPASSWD: ALL
```

## Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.

	chown -R nexus:nexus /opt/nexus
	chown -R nexus:nexus /opt/sonatype-work
	chmod -R 775 /opt/nexus
	chmod -R 775 /opt/sonatype-work

## Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.

	vi /opt/nexus/bin/nexus.rc
	run_as_user="nexus"

## Create nexus as a service

	ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

## Switch as a nexus user and start the nexus service as follows.

	sudo su - nexus

## Enable the nexus services

	sudo systemctl enable nexus

## Start the nexus service

	sudo systemctl start nexus

## Check  the nexus service status

	sudo systemctl status nexus
## Access the Nexus server from Laptop/Desktop browser.
 
	http://IPAddess/Hostname:8081/


## Default Credentials

	User Name:
	Password: 