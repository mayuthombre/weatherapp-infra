# create an application load balancer

#==== Blue Load balancer ====#
resource "aws_alb" "blue_weatherapp" {
  name               = "${var.name}-bluealb"
  load_balancer_type = "application"
  subnets            = var.blue_pubic_subnets

  # Referencing the security group
  security_groups = ["${aws_security_group.blue_lb_sg.id}"]

  tags = merge(
    var.tags,
    {
      environment = "blue"
    }
  )
}


# Creating a target group for the load balancer:
resource "aws_lb_target_group" "blue_weatherapp_target_group" {
  port        = 3000 # port to take connection requests on
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.blue_vpc_id # Referencing the blue VPC
  health_check {
    matcher  = "200"
    path     = "/"
    timeout  = "20"
    interval = "90"
    protocol = "HTTP"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-bluetg"
    }
  )
}

# Create listener for port 80
resource "aws_lb_listener" "blue_listener" {
  load_balancer_arn = aws_alb.blue_weatherapp.arn # Referencing our load balancer
  port              = "443"                       # aksing listener to take HTTP connections on port 80 only
  protocol          = "HTTPS"
  # certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"                                            # forward rule from listener to target group
    target_group_arn = aws_lb_target_group.blue_weatherapp_target_group.arn # Referencing our tagrte group
  }

  tags = merge(
    var.tags,
    {
      name = "${var.name}-bluelisteners"
    }
  )
}

# Forward traffic coming to port 80 onto port 443

resource "aws_lb_listener" "blue_http" {
  load_balancer_arn = aws_alb.blue_weatherapp.arn # Referencing our load balancer
  port              = "80"                        # aksing listener to take HTTP connections on port 80 only
  protocol          = "HTTP"

  default_action {
    type = "redirect" # redirect rule 

    redirect {
      port        = "443" # redirect listner port
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = merge(
    var.tags,
    {
      name = "${var.name}-blueredirectRule"
    }
  )
}