# Create a security group for ECS that will allow traffic only from ALB. i.e. no public internet access

#==== Blue Security group for ECS ====#

resource "aws_security_group" "blue_ecs_sg" {
  description = "security group for ECS - Blue"
  vpc_id      = var.vpc_id

  # Allow incoming traffic only from the ALB
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = [var.blue_lb_sg]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-blueECS-sg"
    }
  )
}

#==== Green Security group for ECS ====#

resource "aws_security_group" "green_ecs_sg" {
  description = "security group for ECS - green"
  vpc_id      = var.vpc_id

  # Allow incoming traffic only from the ALB
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = [var.green_lb_sg]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenECS-sg"
    }
  )
}
