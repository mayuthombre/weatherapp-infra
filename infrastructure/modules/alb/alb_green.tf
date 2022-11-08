# create an application load balancer

#==== green Load balancer ====#
resource "aws_alb" "green_weatherapp" {
  name               = "${var.name}-greenalb"
  load_balancer_type = "application"
  subnets            = var.green_pubic_subnets

  # Referencing the security group
  security_groups = ["${aws_security_group.green_lb_sg.id}"]

  tags = merge(
    var.tags,
    {
      environment = "green"
    }
  )
}


# Creating a target group for the load balancer:
resource "aws_lb_target_group" "green_weatherapp_target_group" {
  port        = 3000 # port to take connection requests on
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.green_vpc_id # Referencing the green VPC
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
      Name = "${var.name}-greentg"
    }
  )
}

# # Create listener for port 80
# resource "aws_lb_listener" "green_listener" {
#   load_balancer_arn = aws_alb.green_weatherapp.arn # Referencing our load balancer
#   port              = "443"                        # aksing listener to take HTTP connections on port 80 only
#   protocol          = "HTTPS"
#   # certificate_arn   = var.certificate_arn

#   default_action {
#     type             = "forward"                                             # forward rule from listener to target group
#     target_group_arn = aws_lb_target_group.green_weatherapp_target_group.arn # Referencing our tagrte group
#   }

#   tags = merge(
#     var.tags,
#     {
#       name = "${var.name}-greenlisteners"
#     }
#   )
# }

# Forward traffic coming to port 80 onto port 443

resource "aws_lb_listener" "green_http" {
  load_balancer_arn = aws_alb.green_weatherapp.arn # Referencing our load balancer
  port              = "80"                         # aksing listener to take HTTP connections on port 80 only
  protocol          = "HTTP"


  default_action {
    type             = "forward"                                             # forward rule from listener to target group
    target_group_arn = aws_lb_target_group.green_weatherapp_target_group.arn # Referencing our tagrte group
  }

  # default_action {
  #   type = "redirect" # redirect rule 

  #   redirect {
  #     port        = "443" # redirect listner port
  #     protocol    = "HTTPS"
  #     status_code = "HTTP_301"
  #   }
  # }

  tags = merge(
    var.tags,
    {
      name = "${var.name}-greenredirectRule"
    }
  )
}