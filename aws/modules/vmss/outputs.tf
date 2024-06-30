output "autoscaling_group_id" {
  description = "The ID of the Auto Scaling group."
  value       = aws_autoscaling_group.main.id
}

output "launch_configuration_id" {
  description = "The ID of the launch configuration."
  value       = aws_launch_configuration.main.id
}
