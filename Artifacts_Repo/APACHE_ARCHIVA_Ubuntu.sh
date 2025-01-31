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

# Set Apache Archiva version
ARCHIVA_VERSION="2.2.3"  # Change this to the desired version
ARCHIVA_HOME="/opt/archiva"

# Download Apache Archiva
echo "Downloading Apache Archiva version ${ARCHIVA_VERSION}..."
wget "https://archive.apache.org/dist/archiva/archiva/${ARCHIVA_VERSION}/binaries/archiva-${ARCHIVA_VERSION}-bin.tar.gz" -O /tmp/archiva.tar.gz

# Create the installation directory
echo "Creating installation directory at ${ARCHIVA_HOME}..."
sudo mkdir -p ${ARCHIVA_HOME}

# Extract the downloaded tarball
echo "Extracting Apache Archiva..."
sudo tar -xzf /tmp/archiva.tar.gz -C ${ARCHIVA_HOME} --strip-components=1

# Clean up the downloaded tarball
echo "Cleaning up..."
rm /tmp/archiva.tar.gz

# Create a systemd service file for Apache Archiva
echo "Creating systemd service file for Apache Archiva..."
cat <<EOL | sudo tee /etc/systemd/system/archiva.service
[Unit]
Description=Apache Archiva
After=network.target

[Service]
Type=simple
User =root
ExecStart=${ARCHIVA_HOME}/bin/archiva console
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Start and enable Apache Archiva service
echo "Starting and enabling Apache Archiva service..."
sudo systemctl start archiva
sudo systemctl enable archiva

# Check the status of Apache Archiva
echo "Checking Apache Archiva status..."
sudo systemctl status archiva

# Print completion message
echo "Apache Archiva installation completed successfully!"
echo "You can access Apache Archiva at http://localhost:8080/archiva"