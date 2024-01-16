output "container_ids" {
  description = "The IDs of the Docker containers"
  value       = docker_container.containers[*].id
}

output "container_names" {
  description = "The names of the Docker containers"
  value       = docker_container.containers[*].name
}

output "container_ips" {
  description = "The IP addresses of the Docker containers"
  value       = docker_container.containers[*].ip_address
}

output "web_app_url" {
  description = "URL to access the web application"
  value       = "http://localhost:8000"
}

output "db_url" {
  description = "URL to access the database"
  value       = "http://localhost:8001"
}