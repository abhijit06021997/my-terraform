variable "instance_type" {
  type = list(string)
  default = [ "t2.nano", "t2.micro" ]
  
}
variable "instance_name" {
  type = list(string)
default = [ "webser-1", "webserver-2" ]
}
