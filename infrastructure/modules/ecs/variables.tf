# variable "weatherapp-cluster" {
#   type        = string
#   description = "cluster name described in tfvars file in main folder"
#   default     = ""
# }

variable "ecsTaskExecutionRole" {
  type        = string
  description = "IAM role called from IAM module"
  default     = ""
}

variable "blue_weatherapp_target_group" {
  type        = string
  description = "load balancer target group value called from ALB module"
  default     = ""
}

variable "green_weatherapp_target_group" {
  type        = string
  description = "load balancer target group value called from ALB module"
  default     = ""
}

variable "blue_private_subnets" {
  type        = list(string)
  description = "public subnet IDs fetched from VPC module"
  default     = [""]
}

variable "green_private_subnets" {
  type        = list(string)
  description = "public subnet IDs fetched from VPC module"
  default     = [""]
}

# variable "service_security_group" {
#   type        = string
#   description = "security group if required"
#   default     = ""
# }

variable "blue_vpc_id" {
  type        = string
  description = "VPC ID to create these security groups within fetched from VPC module"
  default     = ""
}

variable "green_vpc_id" {
  type        = string
  description = "VPC ID to create these security groups within fetched from VPC module"
  default     = ""
}

variable "blue_lb_sg" {
  type        = string
  description = "ALB security group ID exported from ALB moduke"
  default     = ""
}

variable "green_lb_sg" {
  type        = string
  description = "ALB security group ID exported from ALB moduke"
  default     = ""
}


# variable "target_group" {
#   type        = string
#   description = "load balancer target group exported from ALB module"
#   default     = ""
# }

variable "blue_repo_url" {
  type        = string
  description = "ECR repo url exported from ECR module"
  default     = ""
}

variable "green_repo_url" {
  type        = string
  description = "ECR repo url exported from ECR module"
  default     = ""
}

# variable "task_definition" {
#   type        = string
#   description = "task definition exported from another github repo"
#   default     = ""
# }

# variable "container_name" {
#   type        = string
#   description = "container name exported from another github repo"
#   default     = ""
# }

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name for each resource"
  default     = ""
}

variable "cpu_scale_up" {
  type        = number
  description = "max CPU utilisation for scale up policy to kick in"
  default     = 70
}

variable "cpu" {
  type        = string
  description = "CPU units for each task"
  default     = 256
}

variable "memory" {
  type        = string
  description = "memory for tasks"
  default     = 512
}