variable "vpc_cidr" {
  description = "VPC CIDR block"
  default = ""
  type        = string
}


variable "pub_cidr_a" {
  description = "public subnet a CIDR block"
  default = ""
  type = string
}

variable "pub_cidr_b" {
  description = "public subnet b CIDR block"
  default = ""
  type = string
}

variable "pub_cidr_c" {
  description = "public subnet c CIDR block"
  default = ""
  type = string
}

variable "az_a" {
  description = "availability zone in which subnet will be placed"
  default = ""
  type = string
}

variable "az_b" {
  description = "availability zone in which subnet will be placed"
  default = ""
  type = string
}

variable "az_c" {
  description = "availability zone in which subnet will be placed"
  default = ""
  type = string
}

variable "private_cidr_a" {
  description = "private subnet a CIDR block"
  default = ""
  type = string
}

variable "private_cidr_b" {
  description = "private subnet b CIDR block"
  default = ""
  type = string
}

variable "private_cidr_c" {
  description = "private subnet c CIDR block"
  default = ""
  type = string
}

variable "tags" {
  type = map(string)
  description = "Use tags to identify project resources"
}

variable "name" {
  type = string
  description = "name for each resource"
}