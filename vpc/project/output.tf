output "public_ip" {
  description = "for my public ip print"
  value       = aws_instance.ec2.public_ip

}

output "instace_id" {

  description = "for my public ip url"
  value       = aws_instance.ec2.id
}
