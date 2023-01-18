variable "instance_name" {
  type        = string
}

variable "machine_type" {
  type        = string
}

variable "zone" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "tags" {
  type        = list(string)
}

variable "image" {
  type        = string
}

variable "my_label" {
  type        = string
}
  
variable "interface" {
  type        = string
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  type        = string
  default     = ""
}

variable "labels" {
  type        = list(map(string))
  default     = ""
}

variable "deletion_protection" {
  type        = bool
  default     = false
}

variable "min_cpu_platform" {
  type        = string
  default     = ""
}

variable "enable_display" {
  type        = bool
  default     = false
}

variable "allow_stopping_for_update" {
  type        = bool
  default     = false
}

variable "auto_delete" {
  type        = bool
  default     = false
}


variable "device_name" {
  type        = string
  default     = ""
}

variable "mode" {
  type        = string
  default     = "READ_WRITE"
}

variable "size" {
  type        = string
  default     = ""
}

variable "type" {
  type        = string
  default     = ""
}


variable "source" {
  type        = string
  default     = ""
}

variable "email" {
  type        = string
  default     = ""
}

variable "scopes" {
  type        = string
  default     = ""
}


variable "enable_secure_boot" {
  type        = bool
  default     = false
}

variable "enable_vtpm" {
  type        = bool
  default     = true
}

variable "enable_integrity_monitoring" {
  type        = bool
  default     = true
}