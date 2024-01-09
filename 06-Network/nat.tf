#Creating Ellastic ip........ 
resource "aws_eip" "project-devops-Eip" {
  domain   = "vpc"
}

#Creating NAT-GATEWAY................... 
resource "aws_nat_gateway" "project-devops-NGW" {
  allocation_id = aws_eip.project-devops-Eip.id
  subnet_id     = aws_subnet.project-devops-pubsub1.id
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.project-devops-IGW]
  tags = {
    Name = "project-devops-NGW"
  }
}

#Creating Private Route table................. 
resource "aws_route_table" "project-devops-Pri-Rt" {
  vpc_id = aws_vpc.project-devops.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project-devops-NGW.id
  }
  tags = {
    Name = "project-devops-pri-Rt"
  }
}

#Creating pri Subnet attachment
resource "aws_route_table_association" "project-devops-prisub1-A" {
  subnet_id      = aws_subnet.project-devops-prisub1.id
  route_table_id = aws_route_table.project-devops-Pri-Rt.id
}

resource "aws_route_table_association" "project-devops-prisub2-A" {
  subnet_id      = aws_subnet.project-devops-prisub2.id
  route_table_id = aws_route_table.project-devops-Pri-Rt.id
}

resource "aws_route_table_association" "project-devops-prisub3-A" {
  subnet_id      = aws_subnet.project-devops-prisub3.id
  route_table_id = aws_route_table.project-devops-Pri-Rt.id
}