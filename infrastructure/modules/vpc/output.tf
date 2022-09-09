# outout VPC ID to be used for security group creation
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

# output public subnets IDs to be used for creating ALB
output "pub_subnet_id_a" {
  value = aws_subnet.pub_subnet_a.id
}

output "pub_subnet_id_b" {
  value = aws_subnet.pub_subnet_b.id
}

output "pub_subnet_id_c" {
  value = aws_subnet.pub_subnet_c.id
}

# output private subnets IDs to be used for creating ECS service that will deploy containers in private subnet
output "private_subnet_a" {
  value = aws_subnet.private_subnet_a.id
}

output "private_subnet_b" {
  value = aws_subnet.private_subnet_b.id
}

output "private_subnet_c" {
  value = aws_subnet.private_subnet_c.id
}