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









