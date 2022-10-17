output "ec2-public_ip" {
  value = aws_instance.first_ec2.public_ip
  description = "ec2 instance public IP"
}