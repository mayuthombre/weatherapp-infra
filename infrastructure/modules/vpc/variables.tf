variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = ""
}

variable "az_count" {
  type        = string
  description = "The number of Availability zones needed."
  default     = ""
}

variable "public_subnet_cidr_bits" {
  type        = string
  description = "he number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  default     = ""
}

variable "private_subnet_cidr_bits" {
  type        = string
  description = "he number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
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
  description = "region"
  default     = ""
}