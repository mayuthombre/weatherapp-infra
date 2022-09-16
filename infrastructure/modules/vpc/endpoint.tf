# Create endpoint for ECS to pull image directly from the ECR without transversing internet to reduce cost
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  
  tags = var.tags
}

# Create ECS endpoint
resource "aws_vpc_endpoint" "ecs" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id, aws_subnet.private_subnet_c.id]

  tags = merge(
    var.tags,
    {
        Name = "${var.name}-ecs"
    }
  )
}