# Output domain name validation  options
output "dvo" {
  value = aws_acm_certificate.certificate.domain_validation_options
}

# Certificate ARN output to be used by the application load balancer (ALB)
output "certificate_arn" {
  value = aws_acm_certificate.certificate.arn
}