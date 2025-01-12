resource "aws_instance" "DevOps-Hangout" {
  ami           = "ami-07b69f62c1d38b012"
  instance_type = "t2.micro"
  subnet_id     =       aws_subnet.Terraform-Subnet.id
  #security_group_ids =  ["aws_security_group.DevOps-SG.id"]
  vpc_security_group_ids = [aws_security_group.Terraform-SG.id]
  key_name      = "Mumbai-Key-101"

  tags = {
    Name = "DevOps-Hangout"
  }
}

resource "aws_eip" "EIP" {
  instance = aws_instance.DevOps-Hangout.id
  domain   = "vpc"
}