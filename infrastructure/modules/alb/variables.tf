variable "load_balancer_security_group" {
  type        = string
  description = "security group for load balancer"
  default     = {}
}

variable "subnet_id" {
  type        = list(string)
  description = "public subnet IDs fetched from VPC module"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to create these security group within"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "tags used to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name prefix for resource"
  default     = {}
}

variable "certificate_arn" {
  type        = string
  description = "certificate used to make load balancer secure"
  default     = {}
}