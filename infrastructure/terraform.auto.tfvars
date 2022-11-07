# Region in which resources will be deployed
region = "ap-southeast-2"

# Required input variables for complete networking
vpc_cidr                 = "10.0.0.0/24"
az_count                 = 3
public_subnet_cidr_bits  = 4
private_subnet_cidr_bits = 2
# pub_cidr_a     = "10.0.0.16/28"
# pub_cidr_b     = "10.0.0.32/28"
# pub_cidr_c     = "10.0.0.48/28"
# private_cidr_a = "10.0.0.64/26"
# private_cidr_b = "10.0.0.128/26"
# private_cidr_c = "10.0.0.192/26"
# az_a           = "ap-southeast-2a"
# az_b           = "ap-southeast-2b"
# az_c           = "ap-southeast-2c"

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

