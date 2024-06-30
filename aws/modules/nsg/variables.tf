variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "db_sg_name" {
  description = "The name of the security group for the database"
  type        = string
}

variable "db_port" {
  description = "The port for the database"
  type        = number
}

variable "db_cidr_blocks" {
  description = "The CIDR blocks that are allowed to access the database"
  type        = list(string)
}

variable "backend_sg_name" {
  description = "The name of the security group for the backend"
  type        = string
}

variable "backend_port" {
  description = "The port for the backend"
  type        = number
}

variable "backend_cidr_blocks" {
  description = "The CIDR blocks that are allowed to access the backend"
  type        = list(string)
}
