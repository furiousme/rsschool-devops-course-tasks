resource "aws_security_group" "terraform_course_public_subnet_sg" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform_course_public_subnet_sg"
  }
}
resource "aws_security_group" "terraform_course_private_subnet_sg" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform_course_private_subnet_sg"
  }
}

resource "aws_security_group" "terraform_course_bastion_sg" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ip_address}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform_course_bastion_sg"
  }
}

resource "aws_security_group" "terraform_course_k8s_sg" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform_course_k8s_sg"
  }
}