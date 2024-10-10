resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "firstsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_cidr
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
resource "aws_route_table_association" "associate1" {
  subnet_id      = aws_subnet.firstsubnet.id
  route_table_id = aws_route_table.myroutetable.id
}

