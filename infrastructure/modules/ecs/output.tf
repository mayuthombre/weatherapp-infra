# cluster name to pass on to cloudwatch for monitoring CPU utilisation
output "cluster_name" {
  value = aws_ecs_cluster.weatherapp_cluster.arn
}

# service name to pass on to cloudwatch for monitoring CPU utilisation
output "blue_service_name" {
  value = aws_ecs_service.blue_weatherapp_ecsservice.name
}

output "green_service_name" {
  value = aws_ecs_service.blue_weatherapp_ecsservice.name
}