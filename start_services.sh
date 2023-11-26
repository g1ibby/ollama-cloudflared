#!/bin/bash

# Define the service URL, defaulting to http://localhost:11434 if not set
SERVICE_URL=${SERVICE_URL:-http://localhost:11434}

# Check if CLOUDFLARE_TUNNEL_TOKEN is provided
if [ -z "$CLOUDFLARE_TUNNEL_TOKEN" ]; then
    # If the token is not provided, use trycloudflare.com
    echo "No CLOUDFLARE_TUNNEL_TOKEN provided. Starting cloudflared with trycloudflare.com..."
    cloudflared tunnel --no-autoupdate --url $SERVICE_URL &
else
    # If the token is provided, use it to run the tunnel
    echo "Starting cloudflared with provided CLOUDFLARE_TUNNEL_TOKEN..."
    cloudflared tunnel --no-autoupdate run --token $CLOUDFLARE_TUNNEL_TOKEN --url $SERVICE_URL &
fi

# Start the main application
exec /bin/ollama serve

