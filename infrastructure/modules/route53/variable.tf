# give subdomain name
variable "resource_name_prefix" {
  type        = string
  description = "subdomain name if required"
  default     = ""
}

variable "blue_load_balancer_dns_name" {
  type        = string
  description = "dns_name exported from load balancer module"
  default     = ""
}

variable "green_load_balancer_dns_name" {
  type        = string
  description = "dns_name exported from load balancer module"
  default     = ""
}

variable "blue_load_balancer_zone_id" {
  type        = string
  description = "zone_id exported from load balancer module"
  default     = ""
}

variable "green_load_balancer_zone_id" {
  type        = string
  description = "zone_id exported from load balancer module"
  default     = ""
}


# domain name
variable "domain_name" {
  type        = string
  description = "domain name that will be used to access the application"
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