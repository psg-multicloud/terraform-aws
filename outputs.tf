output "subnet_id" {
   value = aws_subnet.subnet_01.id  
}

output "security_group_id" {
  value = aws_security_group.security_group_01.id
}