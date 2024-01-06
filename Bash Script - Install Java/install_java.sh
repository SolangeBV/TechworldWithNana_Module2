#!/bin/bash

display_error() {
    echo "Error: $1"
    exit 1
}

is_java_installed() {
    if command -v java &>/dev/null; then
        return 0
    else
        return 1
    fi
}

check_java_version() {
    local java_version
    java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    # if java_version is not empty
    if [[ -n $java_version ]]; then
        echo "Installed Java version: $java_version"
        if [[ $(echo "$java_version" | cut -d'.' -f1) -lt 11 ]]; then
            echo "Older Java version < 11"
            return 1
        else
            echo "Java version 11+ installed"
            return 0
        fi
    # if java_version is empty
    else
        echo "Java not found"
        return 1
    fi
}

echo "Installing the latest Java version..."
sudo apt update || display_error "Failed to update package list"
sudo apt install -y default-jdk || display_error "Failed to install Java"

if is_java_installed && check_java_version; then
    echo "Java installation successful"
else
    display_error "Java installation failed"
fi
