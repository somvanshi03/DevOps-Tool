# Docker

## Docker Installation on Centos 7

	yum install -y yum-utils -y
	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	//##yum-config-manager --enable docker-ce-nightly
	yum install docker-ce docker-ce-cli containerd.io -y

	systemctl start docker
	systemctl enable docker
	systemctl status docker
	
## Docker Installation on Ubuntu

	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
### Docker version

	docker -v
	docker --version
	docker info
	docker 
## Docker Basic Commands
	
### Docker Pull 
 
	docker pull ubuntu:18.04
	docker pull ubuntu:20.04
	docker pull centos:7
	docker pull httpd
	docker pull mysql

### Docker Images

	docker image ls
	docker images
	
### Docker Search

	docker search ubuntu:18.04
	docker search httpd
	docker search mysql
	
### Docker Run

	docker run -itd ubuntu:20.04 bin/bash
	docker run -it --name singhubuntu1 --hostname devop1.hangout.com ubuntu:20.04 bin/bash
	docker run -id --name devops-apache-app -p 8000:80 httpd:2.4
	docker run -dit --name devop101-web -p 8080:80 -v /home/user/website/:/usr/local/apache2/htdocs/ httpd:2.4 
	vi /home/user/website/index.html
	
### Docker ps

	docker ps 
	doker ps -a
	docker ps -qa
	docker ps -sa
	docker ps -s
	
### Docker Start/Stop
	
	 docker stop  b1ed92e5fd0c b123e07a47b9
	 docker start b1ed92e5fd0c cfdac2bd999f b123e07a47b9
	 
### Docker Restart

	docker restart eb97e3fb71a6
	docker restart mycentos101

### Docker rm & rmi

	docker rm 81ecc232c553 f87d43762d97 b1ed92e5fd0c cfdac2bd999f b123e07a47b9
	docker rmi 
	
	
### Docker Create
	
	docker ps
	docker images 
	docker create -it --name mycentos101 --hostname mycentos101.devops.com centos:7
	docker start 351b481cc65f
	
### Docker Exec

	docker ps
	docker exec -it 351b481cc65f hostname
	docker exec -it fd83047efb35 ls -lrth /tmp
	docker exec -it fd83047efb35 bin/bash
	hostname -a
	hostname -s
	hostname -d
	hostname -f
	hostname -i

	
### Docker CP

	docker cp anaconda-ks.cfg 351b481cc65f:/tmp
	docker exec -it 351b481cc65f ls -lrth /tmp

	
### Docker Events

	docker ps
	docker events --since 1h --until 5m
	

## Docker Pause

	docker pause 351b481cc65f

### Docker Unpause

	docker Unpause 351b481cc65f
	
### Docker update

	docker ps
	docker update --restart always mridulubuntu14	


### Docker Top

	docker ps
	docker top mycentos101
	docker top 351b481cc65f
	
### Docker Commit

	docker ps
	Docker commit <Running_container_ID> <New_Image_Name>
	docker commit eb97e3fb71a6 mycentos103
	docker images
	
	
### Docker Rename

	docker ps 
	docker rename infallible_germain mycentos102
	
	
### Docker History

	docker images
	docker history mycentos103
	
	
### Docker Network

	docker network --help
	docker network create --subnet 10.10.0.0/24 --gateway 10.10.0.1 DevOps-Vnet
	docker network create --subnet 10.20.0.0/24 --gateway 10.20.0.1 DevOps1-Vnet
	docker network ls

	docker network connect DevOps-vNet 351b481cc65f

### Docker Volume

	docker volume --help
	docker volume create devops-vol-101
	docker volume ls
	docker volume inspect devops-vol-101
	docker volume rm devops-vol-101

### Docker Inspect

	docker inspect <Container_id> or <Volume> or <Network>
	docker inspect eb97e3fb71a6
	docker inspect mycentos101
	


### Docker Port

	docker ps
	Docker port ea64751a0b54


### Docker Tag

	docker tag 744 df003db70 mridulnew08:latest
	docker images
	docker tag c4c10589018b mridul08:latest
	docker images
	
### Docker Kill

	docker kill 681391887b00
	
### Docker Login

	docker login
	

### Docker Diff		

	docker ps
	docker diff 351b481cc65f
	

### Docker System

	docker system --help
	docker system df
	docker system info
	docker system events 

## Docker file

### Docker Build

FROM creates a layer from the ubuntu:18.04 Docker image.
COPY adds files from your Docker client’s current directory.
RUN builds your application with make.
CMD specifies what command to run within the container.
PULL - Adds files from your Docker repository
ADD command helps in copying data into a Docker image
--------------- DockerFile----------------------

		vi Dockerfile

		FROM centos:7
		MAINTAINER Mridul
		RUN yum -y install httpd
		RUN echo "Hello Apache server on Ubuntu Docker" > /var/www/html/index.html
		#COPY index.html /var/www/html/
		#workdir /var/www/html
		CMD [ "/usr/sbin/httpd" , "-D", "FOREGROUND"]
		EXPOSE 80 

docker build . -t mridul08/httpd22:v1

docker run -itd -p 9090:80 mridul08/bootstrapimage101:v1.1

http://13.233.92.103:9090/


http://52.91.177.16:9090/startbootstrap-grayscale/dist/

http://52.91.177.16:8090/dist/
docker run -itd -p 9090:80 mridul08/mycentos0409:v3
----------------------------------------------

## Docker Swarm

	Docker Swarm


	Create 3 VM on AWS
	Install docker on all 3 Servers.
		yum install docker -y 
	
	Login to Master and run below command
	
		docker swarm init --advertise-addr <IP_Address_Of Master> 
		
	Join swarm cluster.
	Run join command on all worker nodes
	
	List down node count
		docker node ls
	
	Docker swarm join-token worker
		docker swarm join-token worker
		
	Create swarm service
		docker service create --name myservice -p 8000:80 nginx
		
	List down service
		docker service ls
	Scale up the service
		docker service scale myservice=15	
		
	Check running containers
		docker ps

	Scale down the service.
		docker service scale myservice=10
		docker ps


	 Drain any host from swarm cluster
		docker node update --availability drain <hostname>
		
	Add nodes on swarm cluster	
		docker node update --availability active <hostname>

	Promote and Demote Worker node as swarm master
	Promote
		docker node promote <hostname>
		
	Demote
		docker node demote <hostname>

	 Logs	
		Docker service logs myservice

	Remove node
		docker node rm <hostname>

## Docker Compose

	curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v
mkdir  ~/wordpress-compose && cd ~/wordpress-compose
https://gist.github.com/Devopshangout/ecbc18089c595d931b5218d59d235de7





24  vi index.html
   25  vi file
   26  ls
   27  vi Dockerfile
   28  docker build . -t mridul08/httpd22:v2
   29  docker images
   30  docker run -itd -p 9091:80 mridul08/httpd22:v2
   31  docker ps
   32  docker attach f55d346a287a
   33  docker ps
   34  docker ps -a
   35  docker run -itd -p 9092:80 mridul08/httpd22:v2 bin/bash
   36  docker ps
   37  cat Dockerfile
   38  cat index.html
   39  docker ps
   40  docker exec -it 8aa825ba35e9 ls /var/
   41  docker exec -it 8aa825ba35e9 ls /var/www/html
   42  docker exec -it 8aa825ba35e9 cat /var/www/html/index.html
   43  docker exec -it 8aa825ba35e9
   44  docker attach 8aa825ba35e9
   45  docker ps
   46  docker run -itd -p 9092:80 mridul08/httpd22:v3
   47  docker run -itd -p 9092:80 mridul08/httpd22:v2
   48  docker run -itd -p 9093:80 mridul08/httpd22:v2
   49  docker ps
   50  cat index.html
   51  ls
   52  docker ps
   53  docker exec -it abda93c9c763 ls /var/www/html


https://hub.docker.com/_/microsoft-windows-servercore-iis

Create a Dockerfile with your website
FROM mcr.microsoft.com/windows/servercore/iis

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

WORKDIR /inetpub/wwwroot

COPY content/ .
You can then build and run the Docker image:

$ docker build -t iis-site .
$ docker run -d -p 8000:80 --name my-running-site iis-site





----------------------------------------

	
vi Dockerfile

FROM centos:7
MAINTAINER Mridul
RUN yum -y install httpd
RUN echo "Hello Apache server on CentOS7 based on GCP" > /var/www/html/index.html
#COPY index.html /var/www/html/
#workdir /var/www/html
CMD [ "/usr/sbin/httpd" , "-D", "FOREGROUND"]
EXPOSE 80 

docker build . -t mridul08/httpd22:v1

docker run -itd -p 9090:80 mridul08/httpd22:v1

http://13.233.92.103:9090/


http://52.91.177.16:9090/startbootstrap-grayscale/dist/

http://52.91.177.16:8090/dist/
docker run -itd -p 9090:80 mridul08/mycentos0409:v3

docker image build -t myimage:v1 . 
docker image build -t myimage:v1 .  -f mydockerfile 

bootstrap single page template

https://startbootstrap.com/themes/landing-pages
https://github.com/StartBootstrap/startbootstrap-grayscale.git

------------
1. Login, Tag, Push
4. Container with Random port
5. Container with Volume and Network and Port
6. Docker Build dot net
7. Docker Build java




FROM ubuntu
RUN apt update -y
RUN apt install -y apache2 apache2-utils zip unzip
RUN apt clean
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip 
RUN cp -rvf photogenic/* .
EXPOSE 80
CMD["/usr/sbin/apache2ctl","-D","FOREGROUND"]
===============================================

