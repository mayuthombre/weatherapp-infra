data "aws_route53_zone" "primary" {
  name         = "weatherapp.click"
  private_zone = false
}

resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.resource_name_prefix
  type    = "A"
  ttl     = 10

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}