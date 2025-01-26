
#data for ami filter it 
data "aws_ami" "name" {
    most_recent = true
    owners = [ "amazon"]
  
}
#output for aws ami 
output "aws_ami" {
    value = data.aws_ami.name
  
}


# instace resorce using that ami
resource "aws_instance" "my_instance" {
    ami = "data.aws_ami.name"
    instance_type = "t2.micro"
  
}

#for aws caller identity
data "aws_caller_identity" "name" {
  
}

#print caller identity  using output
output "caller_info" {
  value = data.aws_caller_identity.name
}
