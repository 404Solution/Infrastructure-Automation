variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "instance_count" {
  description = "The number of instances in the scale set"
  type        = number
}

variable "admin_username" {
  description = "The admin username for the VM instances"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM instances"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "lb_backend_address_pool_id" {
  description = "The ID of the load balancer backend address pool"
  type        = string
}

variable "health_probe_id" {
  description = "The ID of the health probe"
  type        = string
}
