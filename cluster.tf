resource "aws_instance" "terraform_course_k8s_server" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.terraform_course_private_subnet_1.id
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.terraform_course_k8s_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.21.3+k3s1 sh -s - server \
                --token=${var.k3s_token} \
                --disable traefik
              chmod 644 /etc/rancher/k3s/k3s.yaml
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform_course_k8s_server"
  }
}

resource "aws_instance" "terraform_course_k8s_agent" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.terraform_course_private_subnet_2.id
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.terraform_course_k8s_sg.id]
  depends_on      = [aws_instance.terraform_course_k8s_server]

  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.21.3+k3s1 K3S_URL=https://${aws_instance.terraform_course_k8s_server.private_ip}:6443 K3S_TOKEN=${var.k3s_token} sh -
              chmod 644 /etc/rancher/k3s/k3s.yaml
              EOF


  user_data_replace_on_change = true

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
