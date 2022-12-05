# Create a CloudWatch alarm for CPU utilsation to send email to subscribers

#### Alarm for Blue service ####
resource "aws_cloudwatch_metric_alarm" "blue_service_CPUuse" {
  alarm_name                = "${var.name}-BluecpuUtilisation"                      # name this Cloudwatch alarm
  comparison_operator       = var.comparison_operator                               # Define the alarm condition
  evaluation_periods        = var.evaluation_periods                                # set how many data period to compare before triggering the alarm
  threshold                 = var.threshhold                                        # define the threshhold value above/below which alarm will be triggered
  alarm_description         = "This metric monitors Fargate Tasks' CPU utilization" # description for alarm
  insufficient_data_actions = []


  metric_query {
    id          = "mm1m0" # this name represents data/mathematical expression
    return_data = "true"  # set this to "true" to use this result as the alarm
    metric {
      metric_name = "CPUUtilization" # name for this metric
      namespace   = "AWS/ECS"        # namespace for this metric. see AWS docs for list of namespaces
      period      = "60"             # period in seconds over which the specified stat is applied
      stat        = "Sum"            # statistic to apply to this metric
      unit        = "Percent"        # unit for this metric

      # Define dimensions for this metric to track. Here we are tracking metric for ECS cluster & service
      dimensions = {
        ClusterName = var.cluster_name
        ServiceName = var.blue_service_name
      }

    }
  }

  # indicate whether or not actions should be taken when this alarm transitions into an ALARM state
  actions_enabled = "true"
  # define what action we want when this alarm transitions to ALARM state
  alarm_actions = [aws_sns_topic.weatherapp-sns.arn]

  tags = merge(
    var.tags,
    {
      name        = "${var.name}-Bluecw",
      environment = "blue"
    }
  )
}


#### Alarm for Green service ####
resource "aws_cloudwatch_metric_alarm" "green_service_CPUuse" {
  alarm_name                = "${var.name}-GreencpuUtilisation"                     # name this Cloudwatch alarm
  comparison_operator       = var.comparison_operator                               # Define the alarm condition
  evaluation_periods        = var.evaluation_periods                                # set how many data period to compare before triggering the alarm
  threshold                 = var.threshhold                                        # define the threshhold value above/below which alarm will be triggered
  alarm_description         = "This metric monitors Fargate Tasks' CPU utilization" # description for alarm
  insufficient_data_actions = []


  metric_query {
    id          = "mm1m0" # this name represents data/mathematical expression
    return_data = "true"  # set this to "true" to use this result as the alarm
    metric {
      metric_name = "CPUUtilization" # name for this metric
      namespace   = "AWS/ECS"        # namespace for this metric. see AWS docs for list of namespaces
      period      = "60"             # period in seconds over which the specified stat is applied
      stat        = "Sum"            # statistic to apply to this metric
      unit        = "Percent"        # unit for this metric

      # Define dimensions for this metric to track. Here we are tracking metric for ECS cluster & service
      dimensions = {
        ClusterName = var.cluster_name
        ServiceName = var.green_service_name
      }

    }
  }

  # indicate whether or not actions should be taken when this alarm transitions into an ALARM state
  actions_enabled = "true"
  # define what action we want when this alarm transitions to ALARM state
  alarm_actions = [aws_sns_topic.weatherapp-sns.arn]

  tags = merge(
    var.tags,
    {
      name        = "${var.name}-Greencw",
      environment = "green"
    }
  )
}