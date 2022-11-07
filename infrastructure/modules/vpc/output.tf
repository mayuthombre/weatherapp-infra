# outout VPC ID to be used for security group creation
output "blue_vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.blue_vpc.id
}

# output public subnets IDs to be used for creating ALB
output "blue_pubic_subnets" {
  value = aws_subnet.blue_pubic_subnet.*.id
}

# output private subnets IDs to be used for creating ECS service that will deploy containers in private subnet
output "blue_private_subnets" {
  value = aws_subnet.blue_private_subnet.*.id
}


# outout VPC ID to be used for security group creation
output "green_vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.green_vpc.id
}

# output public subnets IDs to be used for creating ALB
output "green_pubic_subnets" {
  value = aws_subnet.green_pubic_subnet.*.id
}

# output private subnets IDs to be used for creating ECS service that will deploy containers in private subnet
output "green_private_subnets" {
  value = aws_subnet.green_private_subnet.*.id
}
