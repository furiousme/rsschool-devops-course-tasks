resource "aws_internet_gateway" "terraform_course_main_igw" {
  vpc_id = aws_vpc.terraform_course_main_vpc.id
  tags = {
    Name = "terraform_course_main_igw"
  }
}
