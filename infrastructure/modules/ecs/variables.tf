variable "weatherapp-cluster" {
  default = {}
}

variable "ecsTaskExecutionRole" {
  default = {}
}

variable "weatherapp_target_group" {
  default = {}
}


# private subnet IDs
variable "private_subnet_a" {
  description = "public subnet a"
  default = {}
}

variable "private_subnet_b" {
  description = "public subnet b"
  default = {}
}

variable "private_subnet_c" {
  description = "public subnet c"
  default = {}
}


# security group
variable "service_security_group" {
  default = {}
}

variable "vpc_id" {
  description = "VPC ID to create these security groups within"
  default = {}
}

variable "albsg_id" {
  default = {}
}

variable "subnet_id" {
  type = list(string)
}

variable "target_group" {}

variable "repo_url" {
  
}