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

# Set Nexus version and installation directory
NEXUS_VERSION="3.40.0-02"  # Change this to the desired version
NEXUS_HOME="/opt/nexus"

# Download Nexus Repository Manager
echo "Downloading Nexus Repository Manager version ${NEXUS_VERSION}..."
wget "https://download.sonatype.com/nexus/3/${NEXUS_VERSION}/nexus-${NEXUS_VERSION}-unix.tar.gz" -O /tmp/nexus.tar.gz

# Create the installation directory
echo "Creating installation directory at ${NEXUS_HOME}..."
sudo mkdir -p ${NEXUS_HOME}

# Extract the downloaded tarball
echo "Extracting Nexus Repository Manager..."
sudo tar -xzf /tmp/nexus.tar.gz -C ${NEXUS_HOME} --strip-components=1

# Clean up the downloaded tarball
echo "Cleaning up..."
rm /tmp/nexus.tar.gz

# Create a nexus user
echo "Creating nexus user..."
sudo useradd -r -m -U -d ${NEXUS_HOME} -s /bin/false nexus

# Change ownership of the Nexus directory
echo "Changing ownership of the Nexus directory..."
sudo chown -R nexus:nexus ${NEXUS_HOME}

# Create a systemd service file for Nexus
echo "Creating systemd service file for Nexus..."
cat <<EOL | sudo tee /etc/systemd/system/nexus.service
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=simple
User =nexus
ExecStart=${NEXUS_HOME}/bin/nexus run
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd to recognize the new service
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Start and enable Nexus service
echo "Starting and enabling Nexus service..."
sudo systemctl start nexus
sudo systemctl enable nexus

# Check the status of Nexus
echo "Checking Nexus status..."
sudo systemctl status nexus

# Print completion message
echo "Nexus Repository Manager installation completed successfully!"
echo "You can access Nexus Repository Manager at http://localhost:8081/"