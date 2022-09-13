## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_route53_record.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_load_balancer_dns_name"></a> [load\_balancer\_dns\_name](#input\_load\_balancer\_dns\_name) | dns\_name exported from load balancer module | `string` | `""` | no |
| <a name="input_load_balancer_zone_id"></a> [load\_balancer\_zone\_id](#input\_load\_balancer\_zone\_id) | zone\_id exported from load balancer module | `string` | `""` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | subdomain name if required | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dvo"></a> [dvo](#output\_dvo) | Output domain name validation  options |
