# target group ARN which will be used by the ECS service
output "weatherapp_target_group" {
  value = aws_lb_target_group.weatherapp_target_group.arn
}

output "load_balancer_security_group" {
  value = aws_security_group.load_balancer_security_group.id
}

output "target_group_arn" {
  value = aws_lb_target_group.weatherapp_target_group.arn
}

output "load_balancer_dns_name" {
  value = aws_alb.weatherapp_load_balancer.dns_name
}

output "load_balancer_zone_id" {
  value = aws_alb.weatherapp_load_balancer.zone_id
}