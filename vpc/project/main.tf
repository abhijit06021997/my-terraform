resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "myvpc-1"
  }
}

resource "aws_subnet" "my-subnet-pub" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    name = "mysubnet"
  }

}

resource "aws_internet_gateway" "my-intenetgateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name = "my-inrtergegateway"
  }
}

resource "aws_route_table" "myroute-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-intenetgateway.id
  }
}


  resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my-subnet-pub.id
  route_table_id = aws_route_table.myroute-table.id
}

