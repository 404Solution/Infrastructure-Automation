output "db_instance_endpoint" {
  description = "The endpoint of the database instance."
  value       = aws_db_instance.main.endpoint
}

output "db_instance_identifier" {
  description = "The identifier of the database instance."
  value       = aws_db_instance.main.id
}
