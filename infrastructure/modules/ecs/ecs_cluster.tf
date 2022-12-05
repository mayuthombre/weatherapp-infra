# Create ECS Cluster for usage

resource "aws_ecs_cluster" "weatherapp_cluster" {
  name = "${var.name}-cluster" # Naming the cluster

  tags = var.tags
}