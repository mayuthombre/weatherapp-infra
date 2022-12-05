# Create a new task definition that will be used by ECS service to run tasks

#==== Blue ECS task ====#

resource "aws_ecs_task_definition" "blue_weatherapp_ecstask" {
  family                   = "${var.name}-bluetask" # Naming our first task
  container_definitions    = <<TASK_DEFINITION
  [
    {
      "name": "${var.name}-bluetask",
      "image": "${var.blue_repo_url}",
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
  requires_compatibilities = ["FARGATE"]              # Stating that we are using ECS Fargate to run tasks
  network_mode             = "awsvpc"                 # Using awsvpc as our network mode as this is required for Fargate
  memory                   = var.memory               # Specifying the memory our container requires
  cpu                      = var.cpu                  # Specifying the CPU our container requires
  execution_role_arn       = var.ecsTaskExecutionRole # attach IAM role


  tags = merge(
    var.tags,
    {
      environment = "blue"
    }
  )
}


#==== green ECS task ====#

resource "aws_ecs_task_definition" "green_weatherapp_ecstask" {
  family                   = "${var.name}-greentask" # Naming our first task
  container_definitions    = <<TASK_DEFINITION
  [
    {
      "name": "${var.name}-greentask",
      "image": "${var.green_repo_url}",
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
  requires_compatibilities = ["FARGATE"]              # Stating that we are using ECS Fargate to run tasks
  network_mode             = "awsvpc"                 # Using awsvpc as our network mode as this is required for Fargate
  memory                   = var.memory               # Specifying the memory our container requires
  cpu                      = var.cpu                  # Specifying the CPU our container requires
  execution_role_arn       = var.ecsTaskExecutionRole # attach IAM role


  tags = merge(
    var.tags,
    {
      environment = "green"
    }
  )
}

