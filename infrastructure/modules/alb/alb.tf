# create an application load balancer
resource "aws_alb" "weatherapp_load_balancer" {
  name               = "${var.name}-alb"
  load_balancer_type = "application"
  subnets            = var.subnet_id

  # Referencing the security group
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]

  tags = var.tags
}


# Creating a target group for the load balancer:
resource "aws_lb_target_group" "weatherapp_target_group" {
  port        = 3000 # port to take connection requests on
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id # Referencing the VPC
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
      Name = "${var.name}-tg"
    }
  )
}

# Create listener for port 80
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.weatherapp_load_balancer.arn # Referencing our load balancer
  port              = "443"                                 # aksing listener to take HTTP connections on port 80 only
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"                                       # forward rule from listener to target group
    target_group_arn = aws_lb_target_group.weatherapp_target_group.arn # Referencing our tagrte group
  }

  tags = merge(
    var.tags,
    {
      name = "${var.name}-listeners"
    }
  )
}

# Forward traffic coming to port 80 onto port 443

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.weatherapp_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = merge(
    var.tags,
    {
      name = "${var.name}-redirectRule"
    }
  )
}