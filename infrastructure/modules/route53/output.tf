# Output domain name validatio  options
output "domain_validation" {
  value = aws_acm_certificate.certificate.domain_validation_options
}