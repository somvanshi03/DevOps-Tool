#!/bin/bash

# Update package index
echo "Updating package index..."
sudo apt update

# Install Apache2
echo "Installing Apache2..."
sudo apt install -y apache2

# Create a simple Hello World page
echo "Creating Hello World page..."
echo "<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>" | sudo tee /var/www/html/index.html > /dev/null

# Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

# Output the status of Apache
echo "Apache installation and configuration complete."
sudo systemctl status apache2