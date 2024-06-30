variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "ami" {
  description = "The Amazon Machine Image ID to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
}

variable "instance_name" {
  description = "The name of the instance."
  type        = string
}


variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "vpc_security_group_id" {
  description = "The VPC security group ID to associate with the instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "subnet_ids" {
  description = "The subnets to associate with the ALB."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the ALB and target group will be deployed."
  type        = string
}
