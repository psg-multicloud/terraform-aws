#http://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
#http://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
#http://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
#http://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_vpc" "vpc_01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet_01" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "internet_gateway_01" {
    vpc_id = aws_vpc.vpc_01.id

    tags = {
        Name = "internet-gateway-terraform"
    }
  
}

resource "aws_route_table" "route_table_01" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_01.id
  }


  tags = {
    Name = "route-table-terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet_01.id
  route_table_id = aws_route_table.route_table_01.id
}

resource "aws_security_group" "security_group_01" {
  name        = "allow_ssh_terraform"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc_01.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_terraform"
  }
}