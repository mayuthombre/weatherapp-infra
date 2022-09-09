variable "load_balancer_security_group" {
  default = {}
}

variable "subnet_id" {
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID to create these security groups within"
  default = {}
}

variable "tags" {
  type = map(string)
  description = "Use tags to identify project resources"
}

variable "name" {
  type = string
  description = "name for each resource"
}