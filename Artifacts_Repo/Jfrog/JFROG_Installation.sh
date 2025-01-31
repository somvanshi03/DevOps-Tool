#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y openjdk-11-jdk wget

# Set JFrog Artifactory version
ARTIFACTORY_VERSION="7.39.4"  # Change this to the desired version
ARTIFACTORY_HOME="/opt/jfrog/artifactory"

# Download JFrog Artifactory
echo "Downloading JFrog Artifactory version ${ARTIFACTORY_VERSION}..."
wget "https://releases.jfrog.io/artifactory/artifactory-pro/${ARTIFACTORY_VERSION}/jfrog-artifactory-pro-${ARTIFACTORY_VERSION}-linux.tar.gz" -O /tmp/jfrog-artifactory.tar.gz

# Create the installation directory
echo "Creating installation directory at ${ARTIFACTORY_HOME}..."
sudo mkdir -p ${ARTIFACTORY_HOME}

# Extract the downloaded tarball
echo "Extracting JFrog Artifactory..."
sudo tar -xzf /tmp/jfrog-artifactory.tar.gz -C ${ARTIFACTORY_HOME} --strip-components=1

# Clean up the downloaded tarball
echo "Cleaning up..."
rm /tmp/jfrog-artifactory.tar.gz

# Create a systemd service file for JFrog Artifactory
echo "Creating systemd service file for JFrog Artifactory..."
cat <<EOL | sudo tee /etc/systemd/system/jfrog-artifactory.service
[Unit]
Description=JFrog Artifactory
After=network.target

[Service]
Type=simple
User =root
ExecStart=${ARTIFACTORY_HOME}/bin/artifactory.sh start
ExecStop=${ARTIFACTORY_HOME}/bin/artifactory.sh stop
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Start and enable JFrog Artifactory service
echo "Starting and enabling JFrog Artifactory service..."
sudo systemctl start jfrog-artifactory
sudo systemctl enable jfrog-artifactory

# Check the status of JFrog Artifactory
echo "Checking JFrog Artifactory status..."
sudo systemctl status jfrog-artifactory

# Print completion message
echo "JFrog Artifactory installation completed successfully!"
echo "You can access JFrog Artifactory at http://localhost:8081/artifactory"