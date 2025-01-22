resource "aws_instance" "test" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
    key_name = "abhijit_key"
  
}

resource "aws_key_pair" "my-key" {
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtfKeWvoAXwk77Jrg9m8EmFyVAJ/H9cA2CNSZpoEp6b abhijit@AbhijitRamteke"
    key_name = "abhijit_key"
  
}

#create key in your local using $ ssh-keygen 
#copy pub key in your specifiedpublic key and also attach this key to ec2 instance 
