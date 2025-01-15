#my vpc

resource "aws_vpc" "my-vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

#my subnet

resource "aws_subnet" "my_subnet1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc-1.id
  tags = {
    name = "mysunet-pub"
  }

}


#my ineternetgateway

resource "aws_internet_gateway" "my-aws_internet_gateway" {
  vpc_id = aws_vpc.my-vpc-1.id
  tags = {
    name = "myinternet"
  }
}

# my raute table with raoute 

resource "aws_route_table" "my-route-1" {
  vpc_id = aws_vpc.my-vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-aws_internet_gateway.id


  }

}

# my raoute table association

resource "aws_route_table_association" "myassocition-pub" {
  route_table_id = aws_route_table.my-route-1.id
  subnet_id      = aws_subnet.my_subnet1.id

}

# ec2 instance for my vpc 

resource "aws_instance" "myinstance-vpc-1" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my_subnet1.id

    tags = {
      name = "myinstance-vpc"
    }
  
}
