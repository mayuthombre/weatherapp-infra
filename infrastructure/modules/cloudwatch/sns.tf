
# Create a SNS topic that will be used to send notifications to subscribers
resource "aws_sns_topic" "weatherapp-sns" {
  name = "mayu-weatherapp-sns"

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-sns"
    }
  )
}

# Create a SNS topic subscription
resource "aws_sns_topic_subscription" "weather-snssub" {
  protocol  = "email"                          # define protocol to use
  endpoint  = "mayu.thombre@contino.io"        # endpoint to send data to 
  topic_arn = aws_sns_topic.weatherapp-sns.arn # ARN of the SNS topic created above

  depends_on = [
    aws_sns_topic.weatherapp-sns # ensuring SNS topic is created first
  ]
}