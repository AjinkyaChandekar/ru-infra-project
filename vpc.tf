# Create a VPC
#terraform import aws_vpc.main vpc-0637d37fa8922f30c
resource "aws_vpc" "main" {
  cidr_block       = "10.5.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "ureport-main-vpc"
  }
}

#Create VPC Internet Gateway
#terraform import aws_internet_gateway.main igw-0ed9e2b3cf48aba5a
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ureport-main-internet-gw"
  }
}

# Create Private Subnet
#terraform import aws_subnet.private1 subnet-0bb0189015730c5e7
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.5.1.0/24"

  tags = {
    Name = "private1-subnet"
  }
}

#Create Private Route Table
#terraform import aws_route_table.private1 rtb-0f8786908ea2bf8c0
resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private1-RT"
  }
}

#Association between a Route Table and a Subnet
##terraform import aws_route_table_association.private1 subnet-0bb0189015730c5e7/rtb-0f8786908ea2bf8c0
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

# Create Public Subnet
#terraform import aws_subnet.public1 subnet-023efe946938923f1
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.5.3.0/24"

  tags = {
    Name = "public1-subnet"
  }
}

#Create Public Route Table
#terraform import aws_route_table.public1 rtb-005f035b46447ffe7
resource "aws_route_table" "public1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public1-RT"
  }
}

#Association between a Route Table and a Subnet
#terraform import aws_route_table_association.public1 subnet-023efe946938923f1/rtb-005f035b46447ffe7
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public1.id
}
