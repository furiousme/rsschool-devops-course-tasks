resource "aws_nat_gateway" "terraform_course_nat" {
  allocation_id = aws_eip.terraform_course_nat_eip.id
  subnet_id     = aws_subnet.terraform_course_public_subnet_1.id

  tags = {
    Name = "terraform_course_nat"
  }

  depends_on = [aws_internet_gateway.terraform_course_main_igw]
}

resource "aws_eip" "terraform_course_nat_eip" {
  vpc = true

  tags = {
    Name = "terraform_course_nat_eip"
  }
}