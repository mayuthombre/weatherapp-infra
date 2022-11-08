# # Output domain name validation  options
# output "blue_dvo" {
#   value = aws_acm_certificate.blue_certificate.domain_validation_options
# }

# Certificate ARN output to be used by the application load balancer (ALB)
output "blue_certificate_arn" {
  value = aws_acm_certificate.blue_certificate.arn
}

output "green_certificate_arn" {
  value = aws_acm_certificate.green_certificate.arn
}