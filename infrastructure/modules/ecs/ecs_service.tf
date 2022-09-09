# Create container service
resource "aws_ecs_service" "weatherapp_ecsservice" {
  name            = "${module.locals.name}-service"                # Naming our first service
  cluster         = aws_ecs_cluster.weatherapp-cluster.id                         # Referencing our created Cluster
  task_definition = var.task_definition # Referencing the task our service will spin up
  launch_type     = "FARGATE"                                      # selecing our launch type for running tasks
  desired_count   = 2                                              # Setting the number of containers we want deployed to 3


  # Attach ALB to the ECS service
  load_balancer {
    target_group_arn = var.target_group   # Referencing our target group
    container_name   = var.container_name # Referencing our ECS task definition
    container_port   = 3000                                              # Specifying the container port
  }

  # Define where do we want to launch our containers/tasks
  network_configuration {
    subnets = var.subnet_id
    assign_public_ip = false                                               # Providing our containers with public IPs
    security_groups  = ["${aws_security_group.service_security_group.id}"]                          # attach ECS security group
  }

  tags = module.locals.tags
}
