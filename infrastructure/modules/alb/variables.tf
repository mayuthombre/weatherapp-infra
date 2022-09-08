# variable "pub_subnet_id_a" {
#   description = "public subnet a"
#   default = {}
# }

# variable "pub_subnet_id_b" {
#   description = "public subnet b"
#   default = {}
# }

# variable "pub_subnet_id_c" {
#   description = "public subnet c"
#   default = {}
# }

variable "load_balancer_security_group" {
  default = {}
}

variable "subnet_id" {
  type = list(string)
  # default = [ "aws_subnet.pub_subnet_a.id", "aws_subnet.pub_subnet_b.id}", "aws_subnet.pub_subnet_c.id" ]
}

variable "vpc_id" {
  description = "VPC ID to create these security groups within"
  default = {}
}

variable "availability_zones" {
  type = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

