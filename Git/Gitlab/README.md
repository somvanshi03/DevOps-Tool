# Install and Configure GitLab on Ubuntu

## Prerequisites
	
    4 cores CPU
    4GB of RAM 

## Step 1 — Installing the Dependencies

	sudo apt update
	sudo apt install ca-certificates curl openssh-server postfix tzdata perl
	
## Step 2 — Installing GitLab

	
	cd /tmp
	curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
	sudo bash /tmp/script.deb.sh
	
	sudo EXTERNAL_URL="http://gitlab.abcxyx.com" apt install gitlab-ce -y
	
## Step 3 - Logging In for the First Time

	https://your_domain
	
	Get Root password
	
	cat /etc/gitlab/initial_root_password
	
