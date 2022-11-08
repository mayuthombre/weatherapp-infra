# Create ECS Cluster for usage

#==== Blue cluster ====#

resource "aws_ecs_cluster" "blue_weatherapp_cluster" {
  name = "${var.name}-bluecluster" # Naming the cluster

  tags = merge(
    var.tags,
    {
      environment = "blue"
    }
  )
}

#==== Green cluster ====#

resource "aws_ecs_cluster" "green_weatherapp_cluster" {
  name = "${var.name}-greencluster" # Naming the cluster

  tags = merge(
    var.tags,
    {
      environment = "green"
    }
  )
}