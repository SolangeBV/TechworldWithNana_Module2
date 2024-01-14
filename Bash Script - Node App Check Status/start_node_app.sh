#!/bin/bash

# Function to display an error message and exit the script
display_error() {
    echo "Error: $1"
    exit 1
}

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    display_error "This script must be run as root user"
fi

NEW_USER=myapp

# Create a new user 'myapp'
useradd $NEW_USER -m || display_error "Failed to create user $NEW_USER"

# Check if log directory parameter is provided
if [ -n "$1" ]; then
    log_directory="$1"
    # Check if the provided directory exists
    if [ -d "$log_directory" ]; then
        echo "Using existing log directory: $log_directory"
    # Create the directory if it doesn't exist
    else
        mkdir -p "$log_directory" || display_error "Failed to create log directory"
        echo "Created log directory: $log_directory"
    fi
    export LOG_DIR="$(realpath "$log_directory")"
fi

# Change ownership of application directory to myapp user
chown $NEW_USER:$NEW_USER -R "$LOG_DIR"

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
runuser -l $NEW_USER -c "wget -q \"$artifact_url\"" || display_error "Failed to download artifact file"

# Unzip downloaded file
echo "Unzipping downloaded file..."
runuser -l $NEW_USER -c "tar -xf bootcamp-node-envvars-project-1.0.0.tgz" || display_error "Failed to unzip downloaded file"

# Set up environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# Check if required environment variables are set
if [-z "$APP_ENV"] || [-z "$DB_USER" ] || [ -z "$DB_PWD" ]; then
    display_error "Required environment variable(s) not set. Please set APP_ENV, DB_USER, and DB_PWD."
fi

# Change into the unzipped package directory
cd $LOG_DIR || display_error "Failed to change directory"

# Run NodeJS application with myapp user (synchronously AND in the package directory, so that the application retrieves the correct files)
runuser -l $NEW_USER -c "cd package &&
                        npm install &&
                        node server.js &"

# Display Node.js process information and check if it's running on port 3000
echo "Node.js process information:"
ps aux | grep node | grep -v grep

echo "Node.js running on port 3000:"
netstat -ltnp | grep :3000
