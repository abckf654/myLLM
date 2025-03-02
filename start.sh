#!/bin/bash

# Start Ollama server
ollama serve &

# Wait for Ollama server to be ready
sleep 5

# Pull the Deepseek model
ollama pull deepseek-coder:1.3b

# Start Flask UI
python3 /app/app.py
