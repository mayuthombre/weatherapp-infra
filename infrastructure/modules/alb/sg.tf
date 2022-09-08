# Creating a security group for the load balancer:
resource "aws_security_group" "load_balancer_security_group" {
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  # Set up an inbound rule for ALB Security group to allow connection requests from internet
  ingress {
    from_port   = 80 # Allowing traffic in from port 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
  
  
  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-ALB-sg"
    }
  )
}