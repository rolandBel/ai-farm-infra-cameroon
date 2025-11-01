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

resource "docker_image" "app" {
  name = "python:3.11-slim"
}

resource "docker_container" "farm_api" {
  image   = docker_image.app.name
  name    = "ai-farm-api"
  ports {
    internal = 8000
    external = 8000
  }
  command = [
    "sh", "-c",
    "echo '<h1>Données agricoles – Cameroun</h1><p>Infra déployée avec Terraform</p>' > /app/index.html && cd /app && python3 -m http.server 8000"
  ]
  working_dir = "/app"
}
