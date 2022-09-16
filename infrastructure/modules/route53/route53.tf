data "aws_route53_zone" "primary" {
  name         = "weatherapp.click"
  private_zone = false
}

# create route 53 record 
resource "aws_route53_record" "domain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.resource_name_prefix
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name # attaching load balancer
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# Generate certificate for domain name using ACM
resource "aws_acm_certificate" "certificate" {
  domain_name       = aws_route53_record.domain.name
  validation_method = "DNS"

  depends_on = [
    aws_route53_record.domain
  ]
}

# Certificate validation
resource "aws_acm_certificate_validation" "validation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]

  depends_on = [
    aws_route53_record.cert
  ]
}


# Create record entry for CNAME in the hosted zone weatherapp.click
resource "aws_route53_record" "cert" {
  for_each = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = "${dvo.resource_record_name}"
      record = "${dvo.resource_record_value}"
      type   = "${dvo.resource_record_type}"
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = each.value.record
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.primary.zone_id

  depends_on = [
    aws_route53_record.domain
  ]
}

