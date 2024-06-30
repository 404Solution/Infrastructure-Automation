variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "ami" {
  description = "The Amazon Machine Image ID to use for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instances."
  type        = string
}

variable "vmss_name" {
  description = "The name of the VM scale set."
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instances."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the instances in."
  type        = list(string)
}

variable "vpc_security_group_id" {
  description = "The VPC security group ID to associate with the instances."
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group."
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group."
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group."
  type        = number
}
