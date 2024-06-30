output "instance_id" {
  description = "The ID of the instance."
  value       = aws_instance.main.id
}

output "private_ip" {
  description = "The private IP address of the instance."
  value       = aws_instance.main.private_ip
}

output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = aws_alb.main.dns_name
}
