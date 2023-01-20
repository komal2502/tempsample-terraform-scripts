variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the network being created vpc"
  type        = string
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}



variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}

#subnets

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}
#firewall

variable "rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    name        = string
    description = string
    direction   = string
    priority    = number
    ranges      = list(string)
    target_tags = list(string)
    /*source_tags             = list(string)
    source_service_accounts = list(string)
    
    target_service_accounts = list(string)*/
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    /*deny = list(object({
      protocol = string
      ports    = list(string)
    }))
    log_config = object({
      metadata = string
    })*/
  }))
}

#intances

variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "tags" {
  type = list(string)
}

variable "image" {
  type = string
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  type        = string
  default     = ""
}

variable "labels" {
  type = map(string)
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "min_cpu_platform" {
  type    = string
  default = ""
}

variable "allow_stopping_for_update" {
  type    = bool
  default = false
}

variable "auto_delete" {
  type    = bool
  default = true
}


variable "device_name" {
  type    = string
  default = ""
}

variable "mode" {
  type    = string
  default = "READ_WRITE"
}

variable "size" {
  type    = string
  default = ""
}

variable "type" {
  type    = string
  default = ""
}


variable "source_name" {
  type    = string
  default = ""
}

variable "email" {
  type    = string
  default = ""
}

variable "scopes" {
  type    = list(string)
  default = ["cloud-platform"]
}






