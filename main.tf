module "network" {
  source = "./modules/network"
  project-name = var.project_name
}

module "containers" {
  source = "./modules/containers"
  web_app_image = var.web_app_image
  db_image = var.db_image
  app_names = var.app_names
  network_name = module.network.network_name
  mysql_config = var.mysql_config
}