module "vpc" {
  source = "./modules/vpc"

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

  subnet_id  = [module.vpc.pub_subnet_id_a, module.vpc.pub_subnet_id_b, module.vpc.pub_subnet_id_c]
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]

}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id               = module.vpc.vpc_id
  depends_on           = [module.vpc]
  albsg_id             = module.alb.load_balancer_security_group
  ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
  subnet_id            = [module.vpc.private_subnet_a, module.vpc.private_subnet_b, module.vpc.private_subnet_c]
  target_group         = module.alb.weatherapp_target_group
  repo_url             = module.ecr.repo_url
}

module "iam" {
  source = "./modules/iam"
}

module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket

  tags = var.tags
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshhold          = var.threshhold
  email               = var.email
  cluster_name        = module.ecs.cluster_name
  service_name        = module.ecs.service_name
  depends_on          = [module.ecs]
}