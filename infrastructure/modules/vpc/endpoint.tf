# Create endpoint for ECS to pull image directly from the ECR without transversing internet to reduce cost
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.[${var.region}].s3"
  vpc_endpoint_type = "Interface"

  tags = var.tags
}