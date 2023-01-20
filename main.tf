terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


module "vpc" {
  source                                 = "./module/vpc"
  project_id                             = var.project_id
  network_name                           = var.network_name
  routing_mode                           = var.routing_mode
  auto_create_subnetworks                = var.auto_create_subnetworks
  description                            = var.description
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes

}


module "subnets" {
  source       = "./module/subnets"
  project_id   = var.project_id
  network_name = var.network_name
  subnets      = var.subnets
}


module "firewall-rules" {
  source       = "./module/firewall-rules"
  project_id   = var.project_id
  network_name = var.network_name
  rules        = var.rules
}

module "instance" {
  source                    = "./module/instance"
  instance_name             = var.instance_name
  machine_type              = var.machine_type
  zone                      = var.zone
  labels                    = var.labels
  tags                      = var.tags
  deletion_protection       = var.deletion_protection
  min_cpu_platform          = var.min_cpu_platform
  allow_stopping_for_update = var.allow_stopping_for_update
  network                   = var.network
  auto_delete               = var.auto_delete
  device_name               = var.device_name
  mode                      = var.mode
  size                      = var.size
  type                      = var.type
  image                     = var.image
  source_name               = var.source_name
  email                     = var.email
  scopes                    = var.scopes
}







