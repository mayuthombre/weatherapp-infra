# Create container service

#==== Blue ECS service ====#
resource "aws_ecs_service" "blue_weatherapp_ecsservice" {
  name            = "${var.name}-blueservice"                           # Naming our first service
  cluster         = aws_ecs_cluster.weatherapp_cluster.id               # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.blue_weatherapp_ecstask.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"                                           # selecing our launch type for running tasks
  desired_count   = 1                                                   # Setting the number of containers we want deployed to 3


  # Attach ALB to the ECS service
  load_balancer {
    target_group_arn = var.blue_weatherapp_target_group                       # Referencing our target group
    container_name   = aws_ecs_task_definition.blue_weatherapp_ecstask.family # Referencing our ECS task definition
    container_port   = 3000                                                   # Specifying the container port
  }

  # Define where do we want to launch our containers/tasks
  network_configuration {
    subnets          = var.private_subnets
    assign_public_ip = false                                    # Providing our containers with public IPs
    security_groups  = ["${aws_security_group.blue_ecs_sg.id}"] # attach ECS security group
  }

  tags = merge(
    var.tags,
    {
      environment = "blue"
    }
  )
}


#==== green ECS service ====#

resource "aws_ecs_service" "green_weatherapp_ecsservice" {
  name            = "${var.name}-greenservice"                           # Naming our first service
  cluster         = aws_ecs_cluster.weatherapp_cluster.id                # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.green_weatherapp_ecstask.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"                                            # selecing our launch type for running tasks
  desired_count   = 1                                                    # Setting the number of containers we want deployed to 3


  # Attach ALB to the ECS service
  load_balancer {
    target_group_arn = var.green_weatherapp_target_group                       # Referencing our target group
    container_name   = aws_ecs_task_definition.green_weatherapp_ecstask.family # Referencing our ECS task definition
    container_port   = 3000                                                    # Specifying the container port
  }

  # Define where do we want to launch our containers/tasks
  network_configuration {
    subnets          = var.private_subnets
    assign_public_ip = false                                     # Providing our containers with public IPs
    security_groups  = ["${aws_security_group.green_ecs_sg.id}"] # attach ECS security group
  }

  tags = merge(
    var.tags,
    {
      environment = "green"
    }
  )
}
