variable "comparison_operator" {
  type = string
  # default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
    type = number
    # default = "2"
}

variable "threshhold" {
  type = number
  # default = "20"
}

variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "email" {
  type = string
}