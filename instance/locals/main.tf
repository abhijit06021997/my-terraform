
locals {    # it is used to set common tag for all instance (not use in variable)
  common_tags = {
    team    = "dev"
    purpose = "moniter"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = var.instance_type1
  tags          = local.common_tags
  count         = 1


  #tags = {
  # team = "devops"
  # purpose = "monitering" 
  #}

}

resource "aws_instance" "prod" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = var.instance_type2
  
  tags          = local.common_tags
}



#tags = {
#team = "devops"
# purpose = "monitering"
#}

