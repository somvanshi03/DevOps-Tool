# Install Jenkins on Ubuntu 22.04

## Update OS 

	sudo apt update

## Install Java 

	sudo apt install openjdk-17-jdk -y
	apt update 
	java --version

## Install Depenency

	sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
	  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
	echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
	  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
	  /etc/apt/sources.list.d/jenkins.list > /dev/null

## Install Jenkins

	sudo apt-get update
	sudo apt-get install jenkins -y 


## Setup Path for java and maven

	export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
	export PATH=$JAVA_HOME/bin:$PATH


	export MAVEN_HOME=/usr/share/maven
	export PATH=$MAVEN_HOME/bin:$PATH