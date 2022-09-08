module "locals" {
  source = "../locals"
}

# Create a CloudWatch alarm for CPU utilsation to send email to subscribers
resource "aws_cloudwatch_metric_alarm" "weatherapp-CPUuse" {
  alarm_name                = "${module.locals.name}-cpuUtilisation"                      # name this Cloudwatch alarm
  comparison_operator       = var.comparison_operator                       # Define the alarm condition
  evaluation_periods        = var.evaluation_periods                                                   # set how many data period to compare before triggering the alarm
  threshold                 = var.threshhold                                                  # define the threshhold value above/below which alarm will be triggered
  alarm_description         = "This metric monitors Fargate Tasks' CPU utilization" # description for alarm
  insufficient_data_actions = []


  metric_query {
    id          = "mm1m0" # this name represents data/mathematical expression
    return_data = "true"  # set this to "true" to use this result as the alarm
    metric {
      metric_name = "CPUUtilization" # name for this metric
      namespace   = "AWS/ECS"        # namespace for this metric. see AWS docs for list of namespaces
      period      = "60"             # period in seconds over which the specified stat is applied
      stat        = "Average"            # statistic to apply to this metric
      unit        = "Percent"        # unit for this metric

      # Define dimensions for this metric to track. Here we are tracking metric for ECS cluster & service
      dimensions = {
        ClusterName = var.cluster_name
        ServiceName = var.service_name
        # ClusterName = aws_ecs_cluster.weatherapp-cluster.name,
        # ServiceName = aws_ecs_service.weatherapp_ecsservice.name
      }

    }
  }

  # indicate whether or not actions should be taken when this alarm transitions into an ALARM state
  actions_enabled = "true"
  # define what action we want when this alarm transitions to ALARM state
  alarm_actions = [aws_sns_topic.weatherapp-sns.arn]

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-cw"
    }
  )
}