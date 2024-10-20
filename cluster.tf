resource "aws_instance" "terraform_course_k8s_server" {
  ami             = "ami-0ddc798b3f1a5117e"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.terraform_course_private_subnet_1.id
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.terraform_course_k8s_sg.id]

  user_data = templatefile("k8s_server.sh", {})

  tags = {
    Name = "terraform_course_k8s_server"
  }
}

resource "aws_instance" "terraform_course_k8s_agent" {
  ami             = "ami-0ddc798b3f1a5117e"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.terraform_course_private_subnet_2.id
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.terraform_course_k8s_sg.id]
  depends_on      = [aws_instance.terraform_course_k8s_server]

  user_data = templatefile("k8s_agent.sh", {
    token             = var.k8s_token,
    server_private_ip = aws_instance.terraform_course_k8s_server.private_ip
  })

  tags = {
    Name = "terraform_course_k8s_agent"
  }
}

output "terraform_course_k8s_server_ip_addr" {
  value     = aws_instance.terraform_course_k8s_server.private_ip
  sensitive = true
}

output "terraform_course_k8s_agent_ip_addr" {
  value     = aws_instance.terraform_course_k8s_agent.private_ip
  sensitive = true
}
