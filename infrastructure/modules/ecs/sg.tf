# Create a security group for ECS that will allow traffic only from ALB. i.e. no public internet access
resource "aws_security_group" "service_security_group" {
  description = "security group for ECS"
  vpc_id      = var.vpc_id

  # Allow incoming traffic only from the ALB
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = [var.albsg_id]
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
      name = "${var.name}-ECS-sg"
    }
  )
}