resource "aws_instance" "first_ec2" {
  ami           = var.ami-id
  instance_type = var.instance_type
  key_name      = "web-terraform"
  #key_name      = aws_key_pair.demo-kp.id


  tags = {
    Name = "Web-server-terraform"
  }
  user_data = file("./files/server-script.sh")

  security_groups = [aws_security_group.web_traffic2.name]

}
/* network_interface {
  network_interface_id = aws_network_interface.web-eth0.id
  device_index         = 0
  }   */

