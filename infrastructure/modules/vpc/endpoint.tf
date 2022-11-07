# Create endpoint for ECS to pull image directly from the ECR without transversing internet to reduce cost

#==== Enpoint for blue environment ====#

resource "aws_vpc_endpoint" "blue_s3" {
  vpc_id            = aws_vpc.blue_vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [
    aws_route_table.blue_private_rt.id
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-blues3"
    }
  )
}

resource "aws_vpc_endpoint" "blue_ecs" {
  vpc_id            = aws_vpc.blue_vpc.id
  service_name      = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"
  subnet_ids =     aws_subnet.blue_private_subnet.*.id


  tags = merge(
    var.tags,
    {
      Name = "${var.name}-blueecs"
    }
  )
}


#==== Enpoint for green environment ====#

resource "aws_vpc_endpoint" "green_s3" {
  vpc_id            = aws_vpc.green_vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [
    aws_route_table.green_private_rt.id
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greens3"
    }
  )
}

resource "aws_vpc_endpoint" "green_ecs" {
  vpc_id            = aws_vpc.green_vpc.id
  service_name      = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"
  subnet_ids = aws_subnet.green_private_subnet.*.id

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenecs"
    }
  )
}