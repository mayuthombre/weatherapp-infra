module "vpc" {
  source = "./modules/vpc"

  tags           = var.tags
  name           = var.name
  vpc_cidr       = var.vpc_cidr
  pub_cidr_a     = var.pub_cidr_a
  pub_cidr_b     = var.pub_cidr_b
  pub_cidr_c     = var.pub_cidr_c
  private_cidr_a = var.private_cidr_a
  private_cidr_b = var.private_cidr_b
  private_cidr_c = var.private_cidr_c
  az_a           = var.az_a
  az_b           = var.az_b
  az_c           = var.az_c
}

module "alb" {
  source = "./modules/alb"

  tags            = var.tags
  name            = var.name
  certificate_arn = var.certificate_arn
  subnet_id       = [module.vpc.pub_subnet_id_a, module.vpc.pub_subnet_id_b, module.vpc.pub_subnet_id_c]
  vpc_id          = module.vpc.vpc_id
  depends_on      = [module.vpc]

}

module "ecr" {
  source = "./modules/ecr"

  tags = var.tags
  name = var.name
}

# calling app repo ECS module

module "ecs_app" {
  source = "git::https://github.com/mayuthombre/weatherapp-app.git//infrastructure/modules/ecs?ref=master"

  tags                 = var.tags
  name                 = var.name
  repo_url             = module.ecr.repo_url
  ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
}

module "ecs" {
  source = "./modules/ecs"

  tags                 = var.tags
  name                 = var.name
  vpc_id               = module.vpc.vpc_id
  depends_on           = [module.vpc]
  albsg_id             = module.alb.load_balancer_security_group
  ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
  subnet_id            = [module.vpc.private_subnet_a, module.vpc.private_subnet_b, module.vpc.private_subnet_c]
  target_group         = module.alb.weatherapp_target_group
  repo_url             = module.ecr.repo_url
  task_definition      = module.ecs_app.task_definition
  container_name       = module.ecs_app.container_name
}

module "iam" {
  source = "./modules/iam"

  tags = var.tags
}

# module "s3_bucket" {
#   source = "./modules/s3"
#   bucket = var.bucket

#   tags = var.tags
# }

module "cloudwatch" {
  source = "./modules/cloudwatch"

  tags                = var.tags
  name                = var.name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshhold          = var.threshhold
  email               = var.email
  cluster_name        = module.ecs.cluster_name
  service_name        = module.ecs.service_name
  depends_on          = [module.ecs]
}

module "route53" {
  source = "./modules/route53"

  load_balancer_dns_name = module.alb.load_balancer_dns_name
  load_balancer_zone_id  = module.alb.load_balancer_zone_id
}