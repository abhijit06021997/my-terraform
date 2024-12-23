resource "aws_instance" "dev" {
  ami           = "ami-01816d07b1128cd2d"
  count         = var.is_dev_env == true ? 1 : 0 #denoted if we give value true it will create this instance for 1 time niether won't
  instance_type = "t2.micro"
  tags = {
    default = "web-dev"
  }
}

resource "aws_instance" "prod" {
  ami           = "ami-01816d07b1128cd2d"
  count         = var.is_dev_env == false ? 1 : 0 # denoted if we set value false it will but if true it won't for 1 instnace 
  instance_type = "t2.medium"
  tags = {
    default = "web-prod"
  }
}

