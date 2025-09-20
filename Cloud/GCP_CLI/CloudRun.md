# Install GCP CLI on Ubuntu

	apt update -y
	
	sudo apt-get install apt-transport-https ca-certificates gnupg curl
	
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
	
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	
	
	sudo apt-get update && sudo apt-get install google-cloud-cli -y 
	sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin -y
	
# Authenticate
	
	gcloud auth activate-service-account --key-file=ms-lab-dec-2024-4135d68129c8.json
	gcloud config set project PROJECT_ID
	gcloud auth list
	gcloud compute instances list

	gcloud config set project PROJECT_ID
	
# Create the Artifact Registry repository

	gcloud artifacts repositories create my-docker-repo --repository-format=docker --location=us-central1 --description="My Docker repository"
	
	gcloud artifacts repositories list --location=us-central1
	

# Build and Push Docker Image

	docker build -t us-central1-docker.pkg.dev/my-awesome-project/my-repo/my-app:v1 .
	docker push us-central1-docker.pkg.dev/my-awesome-project/my-repo/my-app:v1