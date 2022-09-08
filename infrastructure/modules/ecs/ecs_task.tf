# Create a new task definition that will be used by ECS service to run tasks
resource "aws_ecs_task_definition" "weatherapp_ecstask" {
  family                   = "${module.locals.name}-ecstask" # Naming our first task
  container_definitions    = <<TASK_DEFINITION
  [
    {
      "name": "${module.locals.name}-ecstask",
      "image": var.repo_url,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000
        }
      ]
    }
  ]
  TASK_DEFINITION
  requires_compatibilities = ["FARGATE"]                           # Stating that we are using ECS Fargate to run tasks
  network_mode             = "awsvpc"                              # Using awsvpc as our network mode as this is required for Fargate
  memory                   = 512                                   # Specifying the memory our container requires
  cpu                      = 256                                   # Specifying the CPU our container requires
  execution_role_arn       = var.ecsTaskExecutionRole              # attach IAM role


  tags = module.locals.tags
}