output "container_ids" {
  description = "The IDs of the Docker containers"
  value       = docker_container.containers[*].id
}

output "container_names" {
  description = "The names of the Docker containers"
  value       = docker_container.containers[*].name
}

output "container_ips" {
  description = "The IP addresses of the containers"
  value       = [for c in docker_container.containers : [for n in c.network_data : n.ip_address]]
}

output "web_app_url" {
  description = "URL to access the web application"
  value       = "http://localhost:8080"
}

output "db_url" {
  description = "URL to access the database"
  value       = "http://localhost:3306"
}