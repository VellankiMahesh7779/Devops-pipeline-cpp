resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "Main_Route_Table"
  }
}

resource "aws_route_table_association" "Public_subnet1_association" {
  subnet_id      = aws_subnet.Public_subnet1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "Public_subnet2_association" {
  subnet_id      = aws_subnet.Public_subnet2.id
  route_table_id = aws_route_table.main.id
}
