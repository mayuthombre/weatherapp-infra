# Target group ARN which will be used by the ECS service
output "blue_weatherapp_target_group" {
  value = aws_lb_target_group.blue_weatherapp_target_group.arn
}

output "green_weatherapp_target_group" {
  value = aws_lb_target_group.green_weatherapp_target_group.arn
}

# load balancer security group for input to ecs security group
output "blue_lb_sg" {
  value = aws_security_group.blue_lb_sg.id
}

output "green_lb_sg" {
  value = aws_security_group.green_lb_sg.id
}


# dns_name to be used by route53
output "blue_load_balancer_dns_name" {
  value = aws_alb.blue_weatherapp.dns_name
}

output "green_load_balancer_dns_name" {
  value = aws_alb.green_weatherapp.dns_name
}


# zone_id to be used by route53

output "blue_load_balancer_zone_id" {
  value = aws_alb.blue_weatherapp.zone_id
}

output "green_load_balancer_zone_id" {
  value = aws_alb.green_weatherapp.zone_id
}