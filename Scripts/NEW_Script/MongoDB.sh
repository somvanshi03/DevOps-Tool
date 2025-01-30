#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Import the public key used by the package management system
echo "Importing MongoDB public GPG key..."
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "Creating MongoDB list file..."
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Reload the local package database
echo "Reloading package database..."
sudo apt update -y

# Install MongoDB
echo "Installing MongoDB..."
sudo apt install -y mongodb-org

# Start MongoDB service
echo "Starting MongoDB service..."
sudo systemctl start mongod

# Enable MongoDB to start on boot
echo "Enabling MongoDB to start on boot..."
sudo systemctl enable mongod

# Check the status of MongoDB
echo "Checking MongoDB status..."
sudo systemctl status mongod

# Print completion message
echo "MongoDB installation completed successfully!"