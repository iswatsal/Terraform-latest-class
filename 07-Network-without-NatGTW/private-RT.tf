
#Creating Private Route table................. 
resource "aws_route_table" "project-devops-Pri-Rt" {
  vpc_id = aws_vpc.project-devops.id
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