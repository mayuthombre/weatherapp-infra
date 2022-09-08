module "locals" {
  source = "../locals"
}

# Create IAM role for the ECS task to be able to get image from ECR Repository
resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "MayuecsTaskExecutionRole" # Naming our role
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = module.locals.tags
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# Attach role policy to the IAM role
resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
