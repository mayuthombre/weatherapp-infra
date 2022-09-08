module "locals" {
  source = "../locals"
}


# Creating a security group for the load balancer:
resource "aws_security_group" "load_balancer_security_group" {
  name        = "${module.locals.name}-ALB-sg"
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

# Create a security group for ECS that will allow traffic only from ALB. i.e. no public internet access
resource "aws_security_group" "service_security_group" {
   name        = "${module.locals.name}-ECS-sg"
  description = "security group for ECS"
  vpc_id      = var.vpc_id

  # Allow incoming traffic only from the ALB
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
  
  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-ECS-sg"
    }
  )
}