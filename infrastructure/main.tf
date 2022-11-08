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

  tags                = var.tags
  name                = var.name
  blue_pubic_subnets  = module.vpc.blue_pubic_subnets
  green_pubic_subnets = module.vpc.green_pubic_subnets
  # subnet_id       = [module.vpc.pub_subnet_id_a, module.vpc.pub_subnet_id_b, module.vpc.pub_subnet_id_c]
  blue_vpc_id     = module.vpc.blue_vpc_id
  green_vpc_id    = module.vpc.green_vpc_id
  depends_on      = [module.vpc]
  certificate_arn = module.route53.certificate_arn
}

module "route53" {
  source = "./modules/route53"

  domain_name                  = var.domain_name
  blue_load_balancer_dns_name  = module.alb.blue_load_balancer_dns_name
  green_load_balancer_dns_name = module.alb.green_load_balancer_dns_name
  blue_load_balancer_zone_id   = module.alb.blue_load_balancer_zone_id
  green_load_balancer_zone_id  = module.alb.green_load_balancer_zone_id
}

module "ecr" {
  source = "./modules/ecr"

  tags = var.tags
  name = var.name
}

module "ecs" {
  source = "./modules/ecs"

  tags                          = var.tags
  name                          = var.name
  blue_vpc_id                   = module.vpc.blue_vpc_id
  green_vpc_id                  = module.vpc.green_vpc_id
  blue_lb_sg                    = module.alb.blue_lb_sg
  green_lb_sg                   = module.alb.green_lb_sg
  ecsTaskExecutionRole          = module.iam.ecsTaskExecutionRole
  blue_private_subnets          = module.vpc.blue_private_subnets
  green_private_subnets         = module.vpc.green_private_subnets
  blue_weatherapp_target_group  = module.alb.blue_weatherapp_target_group
  green_weatherapp_target_group = module.alb.green_weatherapp_target_group
  blue_repo_url                 = module.ecr.blue_repo_url
  green_repo_url                = module.ecr.green_repo_url
  depends_on                    = [module.vpc]
}


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

