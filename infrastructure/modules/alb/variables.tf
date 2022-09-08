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
