module "locals" {
  source = "../locals"
}

# Create ECS Cluster for usage
resource "aws_ecs_cluster" "weatherapp-cluster" {
  name = "${module.locals.name}-cluster" # Naming the cluster

  tags = module.locals.tags
}