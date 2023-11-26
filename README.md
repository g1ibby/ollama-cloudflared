# Ollama-Cloudflared Docker Image

This repository contains the Docker configuration for running an ollama server integrated with Cloudflare Tunnel. The Docker image `g1ibby/ollama-cloudflared` is designed for easy deployment of a secure and efficient server with Cloudflare's tunneling capability.

## Features

- Ollama Server: A versatile server application, ollama is configured to run within this Docker container.
- Cloudflare Tunnel Integration: The container includes cloudflared, enabling secure tunneling through Cloudflare.
- Flexible Configuration: Utilizes environment variables for dynamic configuration, supporting different deployment scenarios.
- Default Fallback: When no Cloudflare Tunnel token is provided, the container defaults to using trycloudflare.com.

## Getting Started

### Prerequisites

- Docker installed on your host machine.
- (Optional) A Cloudflare account for using a specific tunnel.

### Pulling the Docker Image

Pull the image from Docker Hub:

```
docker pull g1ibby/ollama-cloudflared
```

### Running the Container
With a Provided Cloudflare Tunnel Token

If you have a Cloudflare Tunnel token:

```
docker run -e CLOUDFLARE_TUNNEL_TOKEN=<your_tunnel_token> -p 11434:11434 g1ibby/ollama-cloudflared
```

Replace <your_tunnel_token> with your actual Cloudflare Tunnel token.
Without a Provided Tunnel Token

To run the container with the default Cloudflare Tunnel (trycloudflare.com):

```
docker run -e SERVICE_URL=http://localhost:11434 -p 11434:11434 g1ibby/ollama-cloudflared
```

