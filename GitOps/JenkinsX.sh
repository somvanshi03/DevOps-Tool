#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y apt-transport-https curl jq

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install the Jenkins X CLI
echo "Installing Jenkins X CLI..."
curl -L "https://github.com/jenkins-x/jx/releases/download/$(curl --silent "https://api.github.com/repos/jenkins-x/jx/releases/latest" | jq -r '.tag_name')/jx-linux-amd64.tar.gz" | tar xzv "jx"
sudo mv jx /usr/local/bin/

# Verify installations
echo "Verifying installations..."
kubectl version --client
helm version
jx version

# Create a Kubernetes cluster using Minikube (or you can use GKE, EKS, etc.)
echo "Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=none

# Boot Jenkins X
echo "Booting Jenkins X..."
jx boot

# Print completion message
echo "Jenkins X installation completed successfully!"