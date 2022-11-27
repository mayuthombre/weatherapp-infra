# Region in which resources will be deployed
region = "ap-southeast-2"

# Required input variables for complete networking
vpc_cidr                 = "10.0.0.0/16"
az_count                 = 3
public_subnet_cidr_bits  = 8
private_subnet_cidr_bits = 8

# input variables for cloudwatch
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = "2"
threshhold          = "20"

# email where we want SNS alerts delivered
email = "mayu.thombre@contino.io"

# sub-domain name for route 53
domain_name = "weatherapp.click"

# standardised tags that will be used across all the resources that support tagging
tags = {
  owner       = "mayu"
  build       = "weatherapp"
  iac         = "terraform"
  program     = "dojo"
  environment = "dev"
}

# stanadrd prefix for resources names
name = "mayu-weatherapp"

# DNS routing weight
blue_routing_weight  = 100
green_routing_weight = 0