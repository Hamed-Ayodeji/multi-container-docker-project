# define the provider

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# define a docker network to help the containers communicate

resource "docker_network" "network" {
  name = "${var.project-name}-network"
}