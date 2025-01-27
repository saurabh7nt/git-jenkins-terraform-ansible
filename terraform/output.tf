output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_demo_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_demo_server.public_ip
}
