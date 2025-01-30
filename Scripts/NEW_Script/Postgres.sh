#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package list
echo "Updating package list..."
sudo apt update

# Install PostgreSQL and contrib package
echo "Installing PostgreSQL and contrib package..."
sudo apt install -y postgresql postgresql-contrib

# Get the installed PostgreSQL version
PG_VERSION=$(psql -V | awk '{print $3}' | cut -d '.' -f 1)

# Install additional extensions
echo "Installing additional PostgreSQL extensions..."
sudo apt install -y postgis postgresql-$PG_VERSION-postgis-$PG_VERSION \
                    postgresql-$PG_VERSION-pg-stat-statements \
                    postgresql-$PG_VERSION-hstore \
                    postgresql-$PG_VERSION-uuid-ossp

# Enable extensions in PostgreSQL
echo "Enabling extensions in PostgreSQL..."
sudo -i -u postgres psql -c "CREATE DATABASE mydatabase;"
sudo -i -u postgres psql -d mydatabase -c "CREATE EXTENSION postgis;"
sudo -i -u postgres psql -d mydatabase -c "CREATE EXTENSION pg_stat_statements;"
sudo -i -u postgres psql -d mydatabase -c "CREATE EXTENSION hstore;"
sudo -i -u postgres psql -d mydatabase -c "CREATE EXTENSION \"uuid-ossp\";"

# Start and enable PostgreSQL service
echo "Starting and enabling PostgreSQL service..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo "PostgreSQL installation and extension setup completed successfully!"