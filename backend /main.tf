

resource "aws_instance" "web" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  tags = {
    name = "samapler-1"
  }

}
terraform {         # serach terraform backend ==used to store remote state configuration file in created s3 bucket 
  backend "s3" {                    #we put terraform backend with any resorce like s3 bukcet ,vpc,ec2 it store resorce state configuration file in s3 bcuket
    bucket         = "abhijitramteke.site"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    #encrypt        = true
  #  kms_key_id     = "THE_ID_OF_THE_KMS_KEY"
    #dynamodb_table = "THE_ID_OF_THE_DYNAMODB_TABLE"
  }
}
#it store ec2 instance configuration state file in s3 bucket 
