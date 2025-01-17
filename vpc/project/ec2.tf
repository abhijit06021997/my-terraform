resource "aws_instance" "ec2" {
  ami                         = "ami-01816d07b1128cd2d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my-subnet-pub.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my-sec.id]



  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y 
  sudo yum install nginx -y
  sudo systemctl start nginx 
  EOF
}

resource "aws_security_group" "my-sec" {
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    to_port     = 22
    from_port   = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port     = 80
    from_port   = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port     = 0
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
