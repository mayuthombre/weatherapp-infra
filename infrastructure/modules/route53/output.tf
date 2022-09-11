# Output domain name validatio  options
output "dvo" {
  value = aws_acm_certificate.certificate.domain_validation_options
}