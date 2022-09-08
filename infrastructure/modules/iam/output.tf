# ARN of the IAM role that will be used by the ECS task
output "ecsTaskExecutionRole" {
  value = aws_iam_role.ecsTaskExecutionRole.arn
}