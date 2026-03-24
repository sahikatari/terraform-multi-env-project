resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  
tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 1)
   lifecycle {
    prevent_destroy = true
  }
  availability_zone = "ap-south-1a"



  tags = {
    Name = "${var.env}-subnet"
  }
}