# resource "aws_acm_certificate" "cert" {
#   domain_name       = aws_alb.weatherapp_load_balancer.dns_name
#   validation_method = "DNS"

#   tags = merge(
#     module.locals.tags,
#     {
#       name = "${module.locals.name}-certificate"
#     }
#   )

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_acm_certificate_validation" "cert" {
#   certificate_arn = aws_acm_certificate.cert.arn
# }