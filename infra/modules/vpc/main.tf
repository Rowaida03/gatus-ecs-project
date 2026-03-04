# VPC
resource "aws_vpc" "gatus_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Public Subnets (one per AZ)
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.gatus_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-1"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.gatus_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-2"
  }

  
}

# Private Subnets (one per AZ)
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.gatus_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.az1

  tags = {
    Name = "${var.project_name}-private-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.gatus_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.az2

  tags = {
    Name = "${var.project_name}-private-2"
  }
}

# Elastic IP (for NatGW)

resource "aws_eip" "nat_ip" {
  domain = "vpc"
}

# Nat Gateway

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.project_name}-nat-gw"
  }
}

# Internet Gateway 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gatus_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public and Private Route Tables

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.gatus_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.gatus_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

# Route Table Associations

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}