
# Create a SNS topic that will be used to send notifications to subscribers
resource "aws_sns_topic" "weatherapp-sns" {
  name = "${var.name}-sns"

  tags = var.tags
}

# Create a SNS topic subscription
resource "aws_sns_topic_subscription" "weather-snssub" {
  protocol  = "email"                          # define protocol to use
  endpoint  = var.email        # endpoint to send data to 
  topic_arn = aws_sns_topic.weatherapp-sns.arn # ARN of the SNS topic created above

  depends_on = [
    aws_sns_topic.weatherapp-sns # ensuring SNS topic is created first
  ]
}