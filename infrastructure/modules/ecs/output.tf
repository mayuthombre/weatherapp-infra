# cluster name to pass on to cloudwatch for monitoring CPU utilisation
output "cluster_name" {
  value = aws_ecs_cluster.weatherapp_cluster.arn
}

# # service name to pass on to cloudwatch for monitoring CPU utilisation
# output "service_name" {
#   value = aws_ecs_service.weatherapp_ecsservice.name
# }
