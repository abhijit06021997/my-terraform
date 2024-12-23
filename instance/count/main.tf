resource "aws_instance" "name" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = var.instance_type[count.index]

  tags = {
    Name = var.instance_name[count.index]
  }
  count = 2
}

