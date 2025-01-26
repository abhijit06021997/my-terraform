

data "aws_ami" "name" {      #we filter here ami without going dashborad 
    most_recent = true
    owners = [ "amazon"]
  
}

output "aws_ami" {                #we output thta mai on dashboard 
    value = data.aws_ami.name
  
}

resource "aws_instance" "my_instance" {      # we are suing that ami for our instance 
    ami = "data.aws_ami.name"
    instance_type = "t2.micro"
  
}


# we use data sources for created infrastructure we filter specific resorces from that infrastructure to created new infresaturructure for e.g thre are created vpc but we have tio craete instance using that vpc so we can filter those resorces like vpc id ,securitu grous,subnet id,also ami for using instance .
