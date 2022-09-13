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
| [aws_alb.weatherapp_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.weatherapp_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.load_balancer_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | certificate used to make load balancer secure | `string` | `""` | no |
| <a name="input_load_balancer_security_group"></a> [load\_balancer\_security\_group](#input\_load\_balancer\_security\_group) | security group for load balancer | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name prefix for resource | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | public subnet IDs fetched from VPC module | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags used to identify project resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create these security group within | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_dns_name"></a> [load\_balancer\_dns\_name](#output\_load\_balancer\_dns\_name) | dns\_name to be used by route53 |
| <a name="output_load_balancer_security_group"></a> [load\_balancer\_security\_group](#output\_load\_balancer\_security\_group) | load balancer security group for input to ecs security group |
| <a name="output_load_balancer_zone_id"></a> [load\_balancer\_zone\_id](#output\_load\_balancer\_zone\_id) | zone\_id to be used by route53 |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | target group to be used by ecs service |
| <a name="output_weatherapp_target_group"></a> [weatherapp\_target\_group](#output\_weatherapp\_target\_group) | target group ARN which will be used by the ECS service |
