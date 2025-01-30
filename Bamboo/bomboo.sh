#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
BAMBOO_VERSION="9.0.0"  # Change this to the desired version
BAMBOO_HOME="/opt/bamboo"
BAMBOO_INSTALLER="atlassian-bamboo-${BAMBOO_VERSION}-x64.bin"

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y openjdk-11-jdk wget

# Download Bamboo installer
echo "Downloading Bamboo ${BAMBOO_VERSION}..."
wget "https://www.atlassian.com/software/bamboo/downloads/binary/${BAMBOO_INSTALLER}" -O /tmp/${BAMBOO_INSTALLER}

# Make the installer executable
chmod +x /tmp/${BAMBOO_INSTALLER}

# Create Bamboo home directory
echo "Creating Bamboo home directory at ${BAMBOO_HOME}..."
sudo mkdir -p ${BAMBOO_HOME}

# Run the Bamboo installer
echo "Running the Bamboo installer..."
sudo /tmp/${BAMBOO_INSTALLER} -q -var home=${BAMBOO_HOME}

# Clean up the installer
echo "Cleaning up..."
rm /tmp/${BAMBOO_INSTALLER}

# Create a Bamboo service file
echo "Creating Bamboo service file..."
cat <<EOL | sudo tee /etc/systemd/system/bamboo.service
[Unit]
Description=Bamboo Server
After=network.target

[Service]
Type=simple
User =root
ExecStart=/opt/bamboo/bin/start-bamboo.sh
ExecStop=/opt/bamboo/bin/stop-bamboo.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Start and enable Bamboo service
echo "Starting and enabling Bamboo service..."
sudo systemctl start bamboo
sudo systemctl enable bamboo

# Check the status of Bamboo
echo "Checking Bamboo status..."
sudo systemctl status bamboo

# Print completion message
echo "Bamboo installation completed successfully!"