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
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR range for VPC"
  default     = ""
}

variable "pub_cidr_a" {
  type        = string
  description = "CIDR block range for public subnet"
  default     = ""
}

variable "pub_cidr_b" {
  type        = string
  description = "CIDR block range for public subnet"
  default     = ""
}

variable "pub_cidr_c" {
  type        = string
  description = "CIDR block range for public subnet"
  default     = ""
}

variable "private_cidr_a" {
  type        = string
  description = "CIDR block range for private subnet"
  default     = ""
}

variable "private_cidr_b" {
  type        = string
  description = "CIDR block range for private subnet"
  default     = ""
}

variable "private_cidr_c" {
  type        = string
  description = "CIDR block range for private subnet"
  default     = ""
}

variable "az_a" {
  type        = string
  description = "availability zone"
  default     = ""
}

variable "az_b" {
  type        = string
  description = "availability zone"
  default     = ""
}

variable "az_c" {
  type        = string
  description = "availability zone"
  default     = ""
}

variable "comparison_operator" {
  type        = string
  description = "arithmetic operation to use when comparing the specified statistic and threshold"
  default     = ""
}

variable "evaluation_periods" {
  type        = string
  description = "number of periods over which data is compared to the specified threshold"
  default     = ""
}

variable "threshhold" {
  type        = string
  description = "value to compare with the specified statistic"
  default     = ""
}

variable "email" {
  type        = string
  description = "email address for cloudwatch alert notification"
  default     = ""
}

variable "resource_name_prefix" {
  type        = string
  description = "standard prefix for project resources"
  default     = ""
}

variable "certificate_arn" {
  type = string
  description = "certificate ARN generated from AWS console"
  default = ""
}