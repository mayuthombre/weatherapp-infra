# outout VPC ID to be used for security group creation
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

# output public subnets IDs to be used for creating ALB
output "pubic_subnets" {
  value = aws_subnet.pubic_subnet.*.id
}

# output private subnets IDs to be used for creating ECS service that will deploy containers in private subnet
output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}
