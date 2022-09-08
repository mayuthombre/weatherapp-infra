# output cluster ID to be used for ECS service
output "weatherapp-cluster" {
  value = aws_ecs_cluster.weatherapp-cluster.id
}

output "cluster_name" {
  value = aws_ecs_cluster.weatherapp-cluster.name
}

output "service_name" {
  value = aws_ecs_service.weatherapp_ecsservice.name
}
