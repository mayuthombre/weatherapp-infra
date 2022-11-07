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

# variable "pub_cidr_a" {
#   type        = string
#   description = "public subnet a CIDR block"
#   default     = ""
# }

# variable "pub_cidr_b" {
#   type        = string
#   description = "public subnet b CIDR block"
#   default     = ""
# }

# variable "pub_cidr_c" {
#   type        = string
#   description = "public subnet c CIDR block"
#   default     = ""
# }

# variable "az_a" {
#   type        = string
#   description = "availability zone in which subnet will be placed"
#   default     = ""
# }

# variable "az_b" {
#   type        = string
#   description = "availability zone in which subnet will be placed"
#   default     = ""
# }

# variable "az_c" {
#   type        = string
#   description = "availability zone in which subnet will be placed"
#   default     = ""
# }

# variable "private_cidr_a" {
#   type        = string
#   description = "private subnet a CIDR block"
#   default     = ""

# }

# variable "private_cidr_b" {
#   type        = string
#   description = "private subnet b CIDR block"
#   default     = ""
# }

# variable "private_cidr_c" {
#   type        = string
#   description = "private subnet c CIDR block"
#   default     = ""
# }

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

# variable "region" {
#   type        = string
#   description = "region where we want the endpoints created"
#   default     = ""
# }