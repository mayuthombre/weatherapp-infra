## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/alb | n/a |
| <a name="module_cloudwatch"></a> [cloudwatch](#module\_cloudwatch) | ./modules/cloudwatch | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./modules/ecs | n/a |
| <a name="module_ecs_app"></a> [ecs\_app](#module\_ecs\_app) | git::https://github.com/mayuthombre/weatherapp-app.git//infrastructure/modules/ecs | master |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./modules/route53 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_a"></a> [az\_a](#input\_az\_a) | availability zone | `string` | `""` | no |
| <a name="input_az_b"></a> [az\_b](#input\_az\_b) | availability zone | `string` | `""` | no |
| <a name="input_az_c"></a> [az\_c](#input\_az\_c) | availability zone | `string` | `""` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Specifies the name of an S3 Bucket | `string` | `"mayu-pathway-dojo-weatherapp-infra-s3"` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | certificate ARN generated from AWS console | `string` | `""` | no |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | arithmetic operation to use when comparing the specified statistic and threshold | `string` | `""` | no |
| <a name="input_email"></a> [email](#input\_email) | email address for cloudwatch alert notification | `string` | `""` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | number of periods over which data is compared to the specified threshold | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name for each resource | `string` | `""` | no |
| <a name="input_private_cidr_a"></a> [private\_cidr\_a](#input\_private\_cidr\_a) | CIDR block range for private subnet | `string` | `""` | no |
| <a name="input_private_cidr_b"></a> [private\_cidr\_b](#input\_private\_cidr\_b) | CIDR block range for private subnet | `string` | `""` | no |
| <a name="input_private_cidr_c"></a> [private\_cidr\_c](#input\_private\_cidr\_c) | CIDR block range for private subnet | `string` | `""` | no |
| <a name="input_pub_cidr_a"></a> [pub\_cidr\_a](#input\_pub\_cidr\_a) | CIDR block range for public subnet | `string` | `""` | no |
| <a name="input_pub_cidr_b"></a> [pub\_cidr\_b](#input\_pub\_cidr\_b) | CIDR block range for public subnet | `string` | `""` | no |
| <a name="input_pub_cidr_c"></a> [pub\_cidr\_c](#input\_pub\_cidr\_c) | CIDR block range for public subnet | `string` | `""` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | standard prefix for project resources | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |
| <a name="input_threshhold"></a> [threshhold](#input\_threshhold) | value to compare with the specified statistic | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR range for VPC | `string` | `""` | no |

## Outputs

No outputs.
