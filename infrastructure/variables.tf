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

variable "vpc_cidr" {}

variable "pub_cidr_a" {}

variable "pub_cidr_b" {}

variable "pub_cidr_c" {}

variable "private_cidr_a" {}

variable "private_cidr_b" {}

variable "private_cidr_c" {}

variable "az_a" {}

variable "az_b" {}

variable "az_c" {}

variable "comparison_operator" {}

variable "evaluation_periods" {}

variable "threshhold" {}

variable "email" {}