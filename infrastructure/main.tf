module "vpc" {
  source = "./modules/vpc"

  tags                     = var.tags
  name                     = var.name
  vpc_cidr                 = var.vpc_cidr
  az_count                 = var.az_count
  public_subnet_cidr_bits  = var.public_subnet_cidr_bits
  private_subnet_cidr_bits = var.private_subnet_cidr_bits
  region                   = var.region
}

module "iam" {
  source = "./modules/iam"

  tags = var.tags
}

module "alb" {
  source = "./modules/alb"

  tags            = var.tags
  name            = var.name
  blue_pubic_subnets = [module.vpc.blue_pubic_subnets]
  green_pubic_subnets = [module.vpc.green_pubic_subnets]
  # subnet_id       = [module.vpc.pub_subnet_id_a, module.vpc.pub_subnet_id_b, module.vpc.pub_subnet_id_c]
  blue_vpc_id          = module.vpc.blue_vpc_id
  green_vpc_id = module.vpc.green_vpc_id
  depends_on      = [module.vpc]
  # certificate_arn = module.route53.certificate_arn
}

# module "ecr" {
#   source = "./modules/ecr"

#   tags = var.tags
#   name = var.name
# }

# module "ecs" {
#   source = "./modules/ecs"

#   tags                 = var.tags
#   name                 = var.name
#   vpc_id               = module.vpc.vpc_id
#   depends_on           = [module.vpc]
#   albsg_id             = module.alb.load_balancer_security_group
#   ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
#   subnet_id            = [module.vpc.private_subnet_a, module.vpc.private_subnet_b, module.vpc.private_subnet_c]
#   target_group         = module.alb.weatherapp_target_group
#   repo_url             = module.ecr.repo_url
# }

# module "iam" {
#   source = "./modules/iam"

#   tags = var.tags
# }


# module "cloudwatch" {
#   source = "./modules/cloudwatch"

#   tags                = var.tags
#   name                = var.name
#   comparison_operator = var.comparison_operator
#   evaluation_periods  = var.evaluation_periods
#   threshhold          = var.threshhold
#   email               = var.email
#   cluster_name        = module.ecs.cluster_name
#   service_name        = module.ecs.service_name
#   depends_on          = [module.ecs]
# }

# module "route53" {
#   source = "./modules/route53"

#   domain_name            = var.domain_name
#   load_balancer_dns_name = module.alb.load_balancer_dns_name
#   load_balancer_zone_id  = module.alb.load_balancer_zone_id
# }