# module "locals" {
#   source = "../locals"
# }

# Create ECS Cluster for usage
resource "aws_ecs_cluster" "weatherapp-cluster" {
  name = "${var.name}-cluster" # Naming the cluster

  tags = var.tags
}