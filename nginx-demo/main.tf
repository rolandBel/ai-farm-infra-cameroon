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

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  image   = docker_image.nginx.name
  name    = "nginx-demo"
  command = ["nginx", "-g", "daemon off;"]
  ports {
    internal = 80
    external = 8080
  }
}
