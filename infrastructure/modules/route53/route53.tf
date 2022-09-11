data "aws_route53_zone" "primary" {
  name         = "weatherapp.click"
  private_zone = false
}

# create route 53 record 
resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.resource_name_prefix
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name # attaching load balancer
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# Generage certificate for domain name using ACM
resource "aws_acm_certificate" "certificate" {
  domain_name       = aws_route53_record.this.name
  validation_method = "DNS"

  depends_on = [
    aws_route53_record.this
  ]
}


# Create record entry for CNAME in the hosted zone weatherapp.click
resource "aws_route53_record" "cert" {
  for_each = {
    for domain_validation in aws_acm_certificate.certificate.domain_validation_options : domain_validation.domain_name => {
      name   = domain_validation.resource_record_name
      record = domain_validation.resource_record_value
      type   = domain_validation.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.primary.zone_id

  depends_on = [
    aws_route53_record.this
  ]
}

# Certificate validation
resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]

  depends_on = [
    aws_route53_record.cert
  ]
}