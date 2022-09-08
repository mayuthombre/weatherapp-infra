module "locals" {
  source = "../locals"
}

# data "aws_ssm_parameter" "vpc_id" {
#   name  = "/${module.locals.name}/vpc-id"
# }



# # Pull data on the Main Infra public subnets.
# data "aws_subnets" "public" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_ssm_parameter.vpc_id.value]
#   }
#   filter {
#     name = "availability-zone"
#     values = var.availability_zones
#   }
#   tags = {
#     tier = "public"
#   }
# }


# create an application load balancer
resource "aws_alb" "weatherapp_load_balancer" {
  name = "${module.locals.name}-alb"
  load_balancer_type = "application"
  # subnets = data.aws_subnets.public.ids
  subnets = var.subnet_id

  # Referencing the security group
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-alb"
    }
  )
}


# Creating a target group for the load balancer:
resource "aws_lb_target_group" "weatherapp_target_group" {
  port        = 3000                           # port to take connection requests on
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
    module.locals.tags,
    {
      Name = "${module.locals.name}-tg"
    }
  )
}

# Create listener for port 443
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.weatherapp_load_balancer.arn # Referencing our load balancer
  port              = "80"                                 # aksing listener to take HTTP connections on port 80 only
  protocol          = "HTTP"
  # certificate_arn = aws_acm_certificate.cert.arn
  default_action {
    type             = "forward"                                       # forward rule from listener to target group
    target_group_arn = aws_lb_target_group.weatherapp_target_group.arn # Referencing our tagrte group
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-listeners"
    }
  )
}
