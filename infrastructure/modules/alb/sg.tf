# Creating a security group for the load balancer

#==== Blue LB SG ====#
resource "aws_security_group" "blue_lb_sg" {
  description = "Security group for blue ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443 # Allowing traffic in from port 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

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
    var.tags,
    {
      Name        = "${var.name}-blueALB-sg",
      environment = "blue"
    }
  )
}


#==== Green LB SG ====#
resource "aws_security_group" "green_lb_sg" {
  description = "Security group for blue ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443 # Allowing traffic in from port 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

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
    var.tags,
    {
      Name        = "${var.name}-greenALB-sg",
      environment = "green"
    }
  )
}