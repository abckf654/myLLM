#!/bin/bash
set -e

# Stop the Docker container if running
docker ps -q --filter "ancestor=deepseek-all-in-one" | xargs -r docker stop

# Remove the Docker container and image
docker ps -a -q --filter "ancestor=deepseek-all-in-one" | xargs -r docker rm
docker rmi deepseek-all-in-one

# Uninstall Docker (optional)
brew uninstall --cask docker || true
