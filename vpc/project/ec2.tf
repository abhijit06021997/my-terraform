
resource "aws_instance" "my_instance"{
  instance_type               = "t2.micro"
  ami                         = "ami-0cde6390e61a03eee"
  subnet_id                   = aws_subnet.my-subne-pub.id
  vpc_security_group_ids      = ["aws_security_group.example.id"]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo apt install nginx
sudo systemctl start nginx    
EOF

  tags = {
    name = "sample"
  }
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "example"
  vpc_id      = aws_vpc.my-vpc.id
  tags = {
    Name = "example"
  }


  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }




  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

}





