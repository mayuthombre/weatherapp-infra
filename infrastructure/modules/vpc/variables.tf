variable "vpc_cidr" {
  description = "VPC CIDR block"
  default = "10.0.0.0/24"
  type        = string
}


variable "pub_cidr_a" {
  description = "public subnet a CIDR block"
  default = "10.0.0.16/28"
  type = string
}

variable "pub_cidr_b" {
  description = "public subnet b CIDR block"
  default = "10.0.0.32/28"
  type = string
}

variable "pub_cidr_c" {
  description = "public subnet c CIDR block"
  default = "10.0.0.48/28"
  type = string
}

variable "az_a" {
  description = "availability zone in which subnet will be placed"
  default = "us-east-1a"
  type = string
}

variable "az_b" {
  description = "availability zone in which subnet will be placed"
  default = "us-east-1b"
  type = string
}

variable "az_c" {
  description = "availability zone in which subnet will be placed"
  default = "us-east-1c"
  type = string
}

variable "private_cidr_a" {
  description = "private subnet a CIDR block"
  default = "10.0.0.64/26"
  type = string
}

variable "private_cidr_b" {
  description = "private subnet b CIDR block"
  default = "10.0.0.128/26"
  type = string
}

variable "private_cidr_c" {
  description = "private subnet c CIDR block"
  default = "10.0.0.192/26"
  type = string
}


