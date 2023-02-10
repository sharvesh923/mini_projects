# creating custom vpc 

resource "aws_vpc" "NEW_VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "NEW_VPC"
  }
}
# creating internet gate way 
resource "aws_internet_gateway" "my_igw"{

  vpc_id = aws_vpc.NEW_VPC.id
  tags = {
    Name = "my_igw"
  }
}
# creating public subnet 1
resource "aws_subnet" "public_sub_1" {
  vpc_id     = aws_vpc.NEW_VPC.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public_sub_1"
  }
}

# creating route_table

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.NEW_VPC.id

   route{
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.my_igw.id
   }

  tags = {
    Name = "my_rt"
    }

}
# Associating route table to subnets
resource "aws_route_table_association" "my_rta_1" {
  subnet_id      = aws_subnet.public_sub_1.id
  route_table_id = aws_route_table.my_rt.id
}

# creating security group with all trafic:

resource "aws_security_group" "my_sg_1" {
  name           = " my_sg_1"
  vpc_id         = aws_vpc.NEW_VPC.id
  description    = "This is for my testing with all trafic"
#This is inbound rule for my_sg_1
  ingress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  egress { 
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  tags ={
   Name = "my_sg_1"
   }
}
   
 # creating network_interface

resource "aws_network_interface" "test" {
  subnet_id       = aws_subnet.public_sub_1.id
}

# creating key pair for instance

resource "aws_key_pair" "aws4" {
  key_name   = "aws4"
  public_key = var.public_key_aws4
}
#creating ubuntu machine based on region selected
resource "aws_instance" "my_instance" {
  ami           = lookup(var.amis,var.region, "not found")
  instance_type = var.instance_type[0]
  key_name      = "aws4"
  subnet_id     = aws_subnet.public_sub_1.id
  vpc_security_group_ids = [aws_security_group.my_sg_1.id]
  associate_public_ip_address = true
  root_block_device {
    volume_size    = "10"
    volume_type    = "gp2"
  }
  tags = {
    Name = "nginx_web_server"
  }
}
