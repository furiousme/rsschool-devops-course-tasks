resource "aws_instance" "terraform_course_bastion" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.terraform_course_public_subnet_1.id
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.terraform_course_bastion_sg.id]

  tags = {
    Name = "terraform_course_bastion"
  }
}

output "terraform_course_bastion_ip_addr" {
  value     = aws_instance.terraform_course_bastion.public_ip
  sensitive = true
}

