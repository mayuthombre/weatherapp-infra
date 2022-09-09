# output cluster ID to be used for ECS service
output "weatherapp-cluster" {
  value = aws_ecs_cluster.weatherapp-cluster.id
}

# cluster name to pass on to cloudwatch for monitoring CPU utilisation
output "cluster_name" {
  value = aws_ecs_cluster.weatherapp-cluster.name
}

# service name to pass on to cloudwatch for monitoring CPU utilisation
output "service_name" {
  value = aws_ecs_service.weatherapp_ecsservice.name
}
