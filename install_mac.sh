#!/bin/bash
set -e

# Ask for a port number (default: 5000)
read -p "Please enter the port you want to use for the web UI (default: 5000): " PORT
PORT=${PORT:-5000}

# Check if Docker is running, and start it if necessary
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Starting Docker..."
    # Start Docker using Homebrew
    open -a Docker
    # Wait for Docker to start
    echo "Waiting for Docker to start..."
    while ! docker info > /dev/null 2>&1; do
        sleep 2
    done
    echo "Docker started successfully."
else
    echo "Docker is already running."
fi

# Install Docker if not installed (using Homebrew)
brew install --cask docker || true

# Clone the deepseek-docker repository
git clone https://your-repo-link/deepseek-docker.git
cd deepseek-docker

# Build the Docker image
docker build -t deepseek-all-in-one .

# Run the Docker container with the chosen port
docker run -p $PORT:$PORT deepseek-all-in-one
