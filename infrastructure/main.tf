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
  pubic_subnets   = module.vpc.pubic_subnets
  vpc_id          = module.vpc.vpc_id
  certificate_arn = module.route53.certificate_arn
  depends_on      = [module.vpc]
}

module "route53" {
  source = "./modules/route53"

  domain_name                  = var.domain_name
  blue_load_balancer_dns_name  = module.alb.blue_load_balancer_dns_name
  green_load_balancer_dns_name = module.alb.green_load_balancer_dns_name
  blue_load_balancer_zone_id   = module.alb.blue_load_balancer_zone_id
  green_load_balancer_zone_id  = module.alb.green_load_balancer_zone_id
  blue_routing_weight          = var.blue_routing_weight
  green_routing_weight         = var.green_routing_weight
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
  vpc_id                        = module.vpc.vpc_id
  blue_lb_sg                    = module.alb.blue_lb_sg
  green_lb_sg                   = module.alb.green_lb_sg
  ecsTaskExecutionRole          = module.iam.ecsTaskExecutionRole
  private_subnets               = module.vpc.private_subnets
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

