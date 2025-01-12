## VPC

resource "aws_vpc" "Terraform-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Terraform-VPC"
  }
}

## Subnet

resource "aws_subnet" "Terraform-Subnet" {
  vpc_id     = aws_vpc.Terraform-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Terraform-Subnet"
  }
}

## RT

resource "aws_route_table" "Terraform-RT" {
  vpc_id = aws_vpc.Terraform-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-IGW.id
  }
  tags = {
    Name = "Terraform-RT"
  }
}


## RT Integration with IGW

resource "aws_route_table_association" "RT-Association" {
  subnet_id      = aws_subnet.Terraform-Subnet.id
  route_table_id = aws_route_table.Terraform-RT.id
}


## IGW

resource "aws_internet_gateway" "Terraform-IGW" {
  vpc_id = aws_vpc.Terraform-VPC.id

  tags = {
    Name = "Terraform-IGW"
  }
}
