output "instance_public_ip" {
  description = "for my public ip print"
  value       = aws_instance.my_instance.public_ip

}

output "instance_url" {

  description = "for my public ip url"
  value       = "http://${aws_instance.my_instance.public_ip}"
}
