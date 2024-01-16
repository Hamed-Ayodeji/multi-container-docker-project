variable "web_app_image" {
  type = string
  description = "The Docker image for the web application"
}

variable "db_image" {
  type = string
  description = "The Docker image for the database"
}

variable "app_names" {
  type = list(string)
  description = "Names of the applications"
}

variable "network_name" {
  type = string
  description = "Name of the network"
}

variable "mysql_config" {
  type = map(string)
  description = "MySQL configuration"
}