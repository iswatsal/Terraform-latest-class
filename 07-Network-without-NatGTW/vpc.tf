#Creating VPC..............
resource "aws_vpc" "project-devops" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "proect-devops-vpc"
  }
}


#Creating pub-subnets...........
resource "aws_subnet" "project-devops-pubsub1" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "project-devops-pubsub1"
  }
}

resource "aws_subnet" "project-devops-pubsub2" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "project-devops-pubsub2"
  }
}

resource "aws_subnet" "project-devops-pubsub3" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "project-devops-pubsub3"
  }
}

#Creating private subs............
resource "aws_subnet" "project-devops-prisub1" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "project-devops-prisub1"
  }
}

resource "aws_subnet" "project-devops-prisub2" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "project-devops-prisub2"
  }
}

resource "aws_subnet" "project-devops-prisub3" {
  vpc_id     = aws_vpc.project-devops.id
  cidr_block = "20.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "project-devops-prisub3"
  }
}

#Creating IGW............... 
resource "aws_internet_gateway" "project-devops-IGW" {
  vpc_id = aws_vpc.project-devops.id

  tags = {
    Name = "project-devops-IGW"
  }
}

#Creating Public Route table................. 
resource "aws_route_table" "project-devops-Pub-Rt" {
  vpc_id = aws_vpc.project-devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-devops-IGW.id
  }
  tags = {
    Name = "project-devops-Pub-Rt"
  }
}


#Public subnet Route table Association
resource "aws_route_table_association" "project-devops-pubsub1-A" {
  subnet_id      = aws_subnet.project-devops-pubsub1.id
  route_table_id = aws_route_table.project-devops-Pub-Rt.id
}

resource "aws_route_table_association" "project-devops-pubsub2-A" {
  subnet_id      = aws_subnet.project-devops-pubsub2.id
  route_table_id = aws_route_table.project-devops-Pub-Rt.id
}

resource "aws_route_table_association" "project-devops-pubsub3-A" {
  subnet_id      = aws_subnet.project-devops-pubsub3.id
  route_table_id = aws_route_table.project-devops-Pub-Rt.id
}