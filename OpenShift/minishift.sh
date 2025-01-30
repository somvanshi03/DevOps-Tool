#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y apt-transport-https gnupg2 curl wget

# Install VirtualBox (or you can choose KVM)
echo "Installing VirtualBox..."
sudo apt install -y virtualbox

# Install Minishift
echo "Installing Minishift..."
MINISHIFT_VERSION="1.34.3"
curl -L https://github.com/minishift/minishift/releases/download/v$MINISHIFT_VERSION/minishift-$MINISHIFT_VERSION-linux-amd64.tgz -o minishift-$MINISHIFT_VERSION-linux-amd64.tgz
tar xvf minishift-$MINISHIFT_VERSION-linux-amd64.tgz
sudo mv minishift-$MINISHIFT_VERSION-linux-amd64/minishift /usr/local/bin/

# Clean up
rm -rf minishift-$MINISHIFT_VERSION-linux-amd64.tgz minishift-$MINISHIFT_VERSION-linux-amd64

# Verify Minishift installation
echo "Verifying Minishift installation..."
minishift version

# Start Minishift
echo "Starting Minishift..."
minishift start

# Print completion message
echo "Minishift installation and startup complete!"