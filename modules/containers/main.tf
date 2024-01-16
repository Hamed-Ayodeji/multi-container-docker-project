# define the provider

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# create an image for the basic web application

resource "docker_image" "web_app" {
  name = var.web_app_image
  build {
    context = "${path.module}/app"
  }
}

# define the image for the database

resource "docker_image" "db" {
  name = var.db_image
}

# create a container resource for both my web app and the database

resource "docker_container" "containers" {
  count = 2
  name   = element(var.app_names, count.index)
  image  = element([docker_image.web_app.id, docker_image.db.id], count.index)

  env = count.index == 1 ? [for k, v in var.mysql_config : "${k}=${v}"] : []

  ports {
    internal = 80
    external = count.index == 0 ? 8000 : 8001
  }

  volumes {
    container_path = count.index == 0 ? "/app" : "/var/lib/mysql"
    host_path      = count.index == 0 ? "/tmp/web_app" : "/tmp/db"
    read_only      = false
  }

  networks_advanced {
    name    = var.network_name
    aliases = [element(var.app_names, count.index)]
  }
}