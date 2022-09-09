variable "comparison_operator" {
  type        = string
  description = "arithmetic operation to use when comparing the specified statistic and threshold"
  default     = ""
}

variable "evaluation_periods" {
  type        = number
  description = "number of periods over which data is compared to the specified threshold"
}

variable "threshhold" {
  type        = number
  description = "value to compare with the specified statistic"
}

variable "cluster_name" {
  type        = string
  description = "cluster that will be monitored by cloudwatch"
  default     = ""
}

variable "service_name" {
  type        = string
  description = "service name that will be monitored by cloudwatch"
  default     = ""
}

variable "email" {
  type        = string
  description = "email addres to send email notification"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name prefix for each resource"
  default     = ""
}