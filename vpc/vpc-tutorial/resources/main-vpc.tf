
#my vpc
resource "aws_vpc" "my-vpc-1" {
  cidr_block = "10.0.0.0/16"
  

}

#public subnet
resource "aws_subnet" "my-subnet-pub" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc-1.id
  
}

#internetgateway 
resource "aws_internet_gateway" "my-internetgateway" {
  vpc_id = aws_vpc.my-vpc-1.id
  

}

#reaute table 
resource "aws_route_table" "my-route" {
  vpc_id = aws_vpc.my-vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internetgateway.id
  }

}

#subnet associtaion

resource "aws_route_table_association" "my-route-pub" {
  route_table_id = aws_route_table.my-route.id
  subnet_id      = aws_subnet.my-subnet-pub.id



}
