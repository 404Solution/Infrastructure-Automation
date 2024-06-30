variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "db_identifier" {
  description = "The identifier for the database instance."
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage for the database in gigabytes."
  type        = number
}

variable "engine" {
  description = "The database engine to use (e.g., MySQL, PostgreSQL, etc.)."
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use."
  type        = string
}

variable "instance_class" {
  description = "The instance class to use for the database."
  type        = string
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "username" {
  description = "The username for the master database user."
  type        = string
}

variable "password" {
  description = "The password for the master database user."
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to associate with this instance."
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the database instance is publicly accessible."
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  type        = bool
  default     = false
}

variable "vpc_security_group_id" {
  description = "The VPC security group ID to associate with the RDS instance."
  type        = string
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name to use for the RDS instance."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the DB subnet group."
  type        = list(string)
}
