#!/bin/bash

# Function to display an error message and exit the script
display_error() {
    echo "Error: $1"
    exit 1
}

# Install Node.js and NPM and print out versions
echo "Installing Node.js and NPM..."
sudo apt update || display_error "Failed to update package list"
sudo apt install -y nodejs npm || display_error "Failed to install Node.js and NPM"
node_version=$(node -v)
npm_version=$(npm -v)
echo "Node.js version installed: $node_version"
echo "NPM version installed: $npm_version"

# Download artifact file
echo "Downloading artifact file..."
artifact_url="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
wget -q "$artifact_url" || display_error "Failed to download artifact file"

# Unzip downloaded file
echo "Unzipping downloaded file..."
tar -xf bootcamp-node-envvars-project-1.0.0.tgz || display_error "Failed to unzip downloaded file"

# Set environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# Check if required environment variables are set
if [-z "$APP_ENV"] || [-z "$DB_USER" ] || [ -z "$DB_PWD" ]; then
    display_error "Required environment variable(s) not set. Please set APP_ENV, DB_USER, and DB_PWD."
fi

# Change into the unzipped package directory
cd package || display_error "Failed to change directory"

# Run NodeJS application
echo "Running NodeJS application in background..."
npm install || display_error "Failed to install Node.js dependencies"
node server.js &

echo "NodeJS application started successfully!"
