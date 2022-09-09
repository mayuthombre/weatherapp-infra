# give subdomain name
variable "resource_name_prefix" {
  type        = string
  description = "subdomain name if required"
  default     = {}
}

variable "load_balancer_dns_name" {
  type        = string
  description = "dns_name exported from load balancer module"
  default     = {}
}

variable "load_balancer_zone_id" {
  type        = string
  description = "zone_id exported from load balancer module"
  default     = {}
}