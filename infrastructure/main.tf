module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"

  subnet_id = [module.vpc.pub_subnet_id_a, module.vpc.pub_subnet_id_b, module.vpc.pub_subnet_id_c]
  vpc_id = module.vpc.vpc_id
  depends_on = [module.vpc]

}

module "ecs" {
  source = "./modules/ecs"

  vpc_id = module.vpc.vpc_id
  depends_on = [module.vpc]
  albsg_id = module.alb.load_balancer_security_group
  ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
  subnet_id = [module.vpc.private_subnet_a, module.vpc.private_subnet_b, module.vpc.private_subnet_c]
  target_group = module.alb.weatherapp_target_group
}

module "iam" {
  source = "./modules/iam"
}



module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket

  tags = var.tags
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = ["${module.s3_bucket.s3_bucket_name}"]
}

output "bucket_name_arn" {
  description = "The name of the bucket"
  value       = ["${module.s3_bucket.s3_bucket_name_arn}"]
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  cluster_name = module.ecs.cluster_name
  service_name = module.ecs.service_name
  depends_on = [module.ecs]
}