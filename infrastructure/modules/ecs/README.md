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
| [aws_ecs_cluster.weatherapp-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.weatherapp_ecsservice](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_security_group.service_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_albsg_id"></a> [albsg\_id](#input\_albsg\_id) | ALB security group ID exported from ALB moduke | `string` | `""` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | container name exported from another github repo | `string` | `""` | no |
| <a name="input_ecsTaskExecutionRole"></a> [ecsTaskExecutionRole](#input\_ecsTaskExecutionRole) | IAM role called from IAM module | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name for each resource | `string` | `""` | no |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | ECR repo url exported from ECR module | `string` | `""` | no |
| <a name="input_service_security_group"></a> [service\_security\_group](#input\_service\_security\_group) | security group if required | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | public subnet IDs fetched from VPC module | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |
| <a name="input_target_group"></a> [target\_group](#input\_target\_group) | load balancer target group exported from ALB module | `string` | `""` | no |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | task definition exported from another github repo | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create these security groups within fetched from VPC module | `string` | `""` | no |
| <a name="input_weatherapp-cluster"></a> [weatherapp-cluster](#input\_weatherapp-cluster) | cluster name described in tfvars file in main folder | `string` | `""` | no |
| <a name="input_weatherapp_target_group"></a> [weatherapp\_target\_group](#input\_weatherapp\_target\_group) | load balancer target group value called from ALB module | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | cluster name to pass on to cloudwatch for monitoring CPU utilisation |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | service name to pass on to cloudwatch for monitoring CPU utilisation |
| <a name="output_weatherapp-cluster"></a> [weatherapp-cluster](#output\_weatherapp-cluster) | output cluster ID to be used for ECS service |
