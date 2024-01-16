# select the image for the basic web application

resource "docker_image" "web_app" {
  name = "my_web_app:latest"
  build {
    context = "${path.module}/index.html"
  }
}

# select the image for the database

resource "docker_image" "db" {
  name = "mysql:latest"
}

# create a container resource for both my web app and the database

resource "docker_container" "containers" {
  count = 2
  name = "${element(["my_web_app", "my_db"], count.index)}"
  image = "${element([docker_image.web_app.latest, docker_image.db.latest], count.index)}"
  ports {
    internal = 80
    external = count.index == 0 ? 8000 : 8001
  }
  volumes {
    container_path = "/var/lib/mysql"
    host_path = count.index == 0 ? "/tmp/web_app" : "/tmp/db"
    read_only = true
  }
  networks_advanced {
    name = var.network-name
    aliases = [count.index == 0 ? "my_web_app" : "my_db"]
  }
}