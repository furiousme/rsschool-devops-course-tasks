resource "aws_subnet" "terraform_course_public_subnet_1" {
  vpc_id            = aws_vpc.terraform_course_main_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.az[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform_course_public_subnet_1"
  }
}

resource "aws_subnet" "terraform_course_private_subnet_1" {
  vpc_id            = aws_vpc.terraform_course_main_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.az[0]
  tags = {
    Name = "terraform_course_private_subnet_1"
  }
}

resource "aws_subnet" "terraform_course_public_subnet_2" {
  vpc_id            = aws_vpc.terraform_course_main_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.az[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform_course_public_subnet_2"
  }
}

resource "aws_subnet" "terraform_course_private_subnet_2" {
  vpc_id            = aws_vpc.terraform_course_main_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.az[1]
  tags = {
    Name = "terraform_course_private_subnet_2"
  }
}
