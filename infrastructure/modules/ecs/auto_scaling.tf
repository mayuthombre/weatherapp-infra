# Auto scaling for ECS

#==== Blue ASG ====#

resource "aws_appautoscaling_target" "blue_ecs_target" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.weatherapp_cluster.name}/${aws_ecs_service.blue_weatherapp_ecsservice.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "blue_ecs_policy_cpu" {
  name               = "${var.name}-bluecpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.blue_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.blue_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.blue_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = var.cpu_scale_up
  }
}


#==== Green ASG ====#


resource "aws_appautoscaling_target" "green_ecs_target" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.weatherapp_cluster.name}/${aws_ecs_service.green_weatherapp_ecsservice.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "green_ecs_policy_cpu" {
  name               = "${var.name}-greencpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.green_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.green_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.green_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = var.cpu_scale_up
  }
}

