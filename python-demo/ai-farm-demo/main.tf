terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Déclare l'image Python
resource "docker_image" "python" {
  name = "python:3.11-slim"
}

# Déclare le conteneur qui l'utilise
resource "docker_container" "farm_api" {
  image   = docker_image.python.name
  name    = "ai-farm-api"
  ports {
    internal = 8000
    external = 8000
  }
  command = ["/bin/sh", "-c", "echo '<h1>Données agricoles simulées – Cameroun</h1><p>Infrastructure as Code avec Terraform</p>' > /app/index.html && cd /app && python3 -m http.server 8000"]
  working_dir = "/app"
}
