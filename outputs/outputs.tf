output "aws_public_ip" {    # outputs is used to print particular value or resource while creating infrastructure such as public ip,private ip,security name after "terraform apply"
    value = aws_instance.name.public_ip
  
}
