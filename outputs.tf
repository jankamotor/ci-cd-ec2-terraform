output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.first_ec2.id
}

output "ec2-public_ip" {
  description = "ec2 Instance Public IP"
  value       = aws_instance.first_ec2.public_ip

}