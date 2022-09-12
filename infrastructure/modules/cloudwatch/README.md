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
| [aws_cloudwatch_metric_alarm.weatherapp-CPUuse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.weatherapp-sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.weather-snssub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | cluster that will be monitored by cloudwatch | `string` | `""` | no |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | arithmetic operation to use when comparing the specified statistic and threshold | `string` | `""` | no |
| <a name="input_email"></a> [email](#input\_email) | email addres to send email notification | `string` | `""` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | number of periods over which data is compared to the specified threshold | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | name prefix for each resource | `string` | `""` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | service name that will be monitored by cloudwatch | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |
| <a name="input_threshhold"></a> [threshhold](#input\_threshhold) | value to compare with the specified statistic | `number` | n/a | yes |

## Outputs

No outputs.
