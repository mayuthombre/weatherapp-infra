# ALB security group ID
output "load_balancer_security_group" {
  value = aws_security_group.load_balancer_security_group.id
}

# ECS security group ID
output "service_security_group" {
  value = aws_security_group.service_security_group.id
}