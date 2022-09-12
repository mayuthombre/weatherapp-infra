# Required input variables for complete networking
vpc_cidr       = "10.0.0.0/24"
pub_cidr_a     = "10.0.0.16/28"
pub_cidr_b     = "10.0.0.32/28"
pub_cidr_c     = "10.0.0.48/28"
private_cidr_a = "10.0.0.64/26"
private_cidr_b = "10.0.0.128/26"
private_cidr_c = "10.0.0.192/26"
az_a           = "ap-southeast-2a"
az_b           = "ap-southeast-2b"
az_c           = "ap-southeast-2c"

# input variables for cloudwatch
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = "2"
threshhold          = "20"

# email where we want SNS alerts delivered
email = "mayu.thombre@contino.io"

# sub-domain name for route 53
resource_name_prefix = "weatherapp.click"

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

#certificate ARN
certificate_arn = "arn:aws:acm:ap-southeast-2:152848913167:certificate/17bc7119-e995-4936-b634-f5ca1b2c2c27"