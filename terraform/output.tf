

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.app_demo_server[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.app_demo_server[*].public_ip
}
