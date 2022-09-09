variable "bucket" {
  type        = string
  description = "Specifies the name of an S3 Bucket"
  default     = "mayu-pathway-dojo-weatherapp-infra-s3"
}

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name for each resource"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR range for VPC"
}

variable "pub_cidr_a" {
  type = string
  description = "CIDR block range for public subnet"
}

variable "pub_cidr_b" {
  type = string
  description = "CIDR block range for public subnet"
}

variable "pub_cidr_c" {
  type = string
  description = "CIDR block range for public subnet"
}

variable "private_cidr_a" {
  type = string
  description = "CIDR block range for private subnet"
}

variable "private_cidr_b" {
  type = string
  description = "CIDR block range for private subnet"
}

variable "private_cidr_c" {
  type = string
  description = "CIDR block range for private subnet"
}

variable "az_a" {
  type = string
  description = "availability zone"
}

variable "az_b" {
  type = string
  description = "availability zone"
}

variable "az_c" {
  type = string
  description = "availability zone"
}

variable "comparison_operator" {
  type = string
  description = "arithmetic operation to use when comparing the specified statistic and threshold"
}

variable "evaluation_periods" {
  type = string
  description = "number of periods over which data is compared to the specified threshold"
}

variable "threshhold" {
  type = string
  description = "value to compare with the specified statistic"
}

variable "email" {
  type = string
  description = "email address for cloudwatch alert notification"
}

variable "resource_name_prefix" {
  type = string
  description = "standard prefix for project resources"
}

