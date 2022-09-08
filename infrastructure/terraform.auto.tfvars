# Required input variables for complete networking
vpc_cidr       = "10.0.0.0/24"
pub_cidr_a     = "10.0.0.16/28"
pub_cidr_b     = "10.0.0.32/28"
pub_cidr_c     = "10.0.0.48/28"
private_cidr_a = "10.0.0.64/26"
private_cidr_b = "10.0.0.128/26"
private_cidr_c = "10.0.0.192/26"
az_a           = "us-east-1a"
az_b           = "us-east-1b"
az_c           = "us-east-1c"

# input variables for cloudwatch
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = "2"
threshhold          = "20"

# email where we want SNS alerts delivered
email = "mayu.thombre@contino.io"