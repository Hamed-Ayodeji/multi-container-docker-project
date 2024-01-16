# define a docker network to help the containers communicate

resource "docker_network" "network" {
  name = "${var.project-name}-network"
}