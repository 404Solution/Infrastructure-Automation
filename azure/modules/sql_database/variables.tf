variable "sql_server_name" {
  description = "The name of the SQL server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL server."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the SQL database."
  type        = string
}
