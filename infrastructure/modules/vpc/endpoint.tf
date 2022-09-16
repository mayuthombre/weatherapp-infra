# Create endpoint for ECS to pull image directly from the ECR without transversing internet to reduce cost
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [
    aws_route_table.private_rt_a.id, 
    aws_route_table.private_rt_b.id, 
    aws_route_table.private_rt_c.id
    ]
  
  tags = merge(
    var.tags,
    {
        Name = "${var.name}-s3"
    }
  )
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    aws_subnet.private_subnet_a.id, 
    aws_subnet.private_subnet_b.id, 
    aws_subnet.private_subnet_c.id
    ]

  tags = merge(
    var.tags,
    {
        Name = "${var.name}-ecs"
    }
  )
}