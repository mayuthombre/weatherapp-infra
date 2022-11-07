variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = ""

}

variable "pub_cidr_a" {
  type        = string
  description = "public subnet a CIDR block"
  default     = ""
}

variable "pub_cidr_b" {
  type        = string
  description = "public subnet b CIDR block"
  default     = ""
}

variable "pub_cidr_c" {
  type        = string
  description = "public subnet c CIDR block"
  default     = ""
}

variable "az_a" {
  type        = string
  description = "availability zone in which subnet will be placed"
  default     = ""
}

variable "az_b" {
  type        = string
  description = "availability zone in which subnet will be placed"
  default     = ""
}

variable "az_c" {
  type        = string
  description = "availability zone in which subnet will be placed"
  default     = ""
}

variable "private_cidr_a" {
  type        = string
  description = "private subnet a CIDR block"
  default     = ""

}

variable "private_cidr_b" {
  type        = string
  description = "private subnet b CIDR block"
  default     = ""
}

variable "private_cidr_c" {
  type        = string
  description = "private subnet c CIDR block"
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

variable "region" {
  type        = string
  description = "region where we want the endpoints created"
  default     = ""
}