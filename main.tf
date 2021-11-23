resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
      Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}

# SUBNETS
## PUBLIC
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_b_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_c_cidr
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-c"
  }
}

#PRIVATE
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr 
  availability_zone = "${var.region}a"

  tags = {
    Name = "talent-academy-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_b_cidr 
  availability_zone = "${var.region}b"

  tags = {
    Name = "talent-academy-private-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_c_cidr 
  availability_zone = "${var.region}c"

  tags = {
    Name = "talent-academy-private-c"
  }
}

## ElasticIP FOR SUBNET A
## one EIP for each nat gateway
resource "aws_eip" "nat_a_eip" {
 # instance = aws_instance.web.id
  vpc      = true
}

##NAT GW

resource "aws_nat_gateway" "nat_a_gw" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#NAT GW SUBNET B
resource "aws_eip" "nat_b_eip" {
 # instance = aws_instance.web.id
  vpc      = true
}


resource "aws_nat_gateway" "nat_b_gw" {
  allocation_id = aws_eip.nat_b_eip.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "NAT gateway b" 
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#NAT GW SUBNET C
resource "aws_eip" "nat_c_eip" {
 # instance = aws_instance.web.id
  vpc      = true
}


resource "aws_nat_gateway" "nat_c_gw" {
  allocation_id = aws_eip.nat_c_eip.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "NAT gateway c"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}


