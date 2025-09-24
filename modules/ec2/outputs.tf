# modules/ec2/outputs.tf

output "instance_ids" {
  value = aws_instance.my_instance[*].id
}

output "public_ips" {
  value = aws_instance.my_instance[*].public_ip
}
