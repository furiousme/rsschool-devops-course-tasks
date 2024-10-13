resource "aws_route_table" "terraform_course_public_route_table" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_course_main_igw.id
  }
  tags = {
    Name = "terraform_course_public_route_table"
  }
}

resource "aws_route_table_association" "pb_sub_1_association" {
  subnet_id      = aws_subnet.terraform_course_public_subnet_1.id
  route_table_id = aws_route_table.terraform_course_public_route_table.id
}

resource "aws_route_table_association" "pb_sub_2_association" {
  subnet_id      = aws_subnet.terraform_course_public_subnet_2.id
  route_table_id = aws_route_table.terraform_course_public_route_table.id
}

resource "aws_route_table" "terraform_course_private_route_table" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_course_nat.id
  }

  tags = {
    Name = "terraform_course_private_route_table"
  }
}

resource "aws_route_table_association" "pv_subnet_1_association" {
  subnet_id      = aws_subnet.terraform_course_private_subnet_1.id
  route_table_id = aws_route_table.terraform_course_private_route_table.id
}

resource "aws_route_table_association" "pv_subnet_2_association" {
  subnet_id      = aws_subnet.terraform_course_private_subnet_2.id
  route_table_id = aws_route_table.terraform_course_private_route_table.id
}
