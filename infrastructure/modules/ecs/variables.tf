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

variable "private_subnets" {
  type        = list(string)
  description = "public subnet IDs fetched from VPC module"
  default     = [""]
}

variable "vpc_id" {
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