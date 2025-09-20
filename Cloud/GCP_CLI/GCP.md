# Install GCP CLI on Ubuntu

	apt update -y
	
	sudo apt-get install apt-transport-https ca-certificates gnupg curl
	
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
	
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	
	
	sudo apt-get update && sudo apt-get install google-cloud-cli -y 
	sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin -y 
	
# Authenticate
	
	gcloud auth activate-service-account --key-file=ms-lab-dec-2024-4135d68129c8.json
	gcloud auth list
	gcloud compute instances list
	
# Install Kubectl on Ubuntu

	wget https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl

	kubectl version --client
	kubectl version --client --output=yaml
	
	gcloud container clusters list


