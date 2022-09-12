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
| [aws_eip.eip_ngw_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eip_ngw_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eip_ngw_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_rt_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_rt_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_rt_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.pub_rt_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.pub_rt_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.pub_rt_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pub_subnet_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pub_subnet_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pub_subnet_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pub_subnet_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pub_subnet_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pub_subnet_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_a"></a> [az\_a](#input\_az\_a) | availability zone in which subnet will be placed | `string` | `""` | no |
| <a name="input_az_b"></a> [az\_b](#input\_az\_b) | availability zone in which subnet will be placed | `string` | `""` | no |
| <a name="input_az_c"></a> [az\_c](#input\_az\_c) | availability zone in which subnet will be placed | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name for each resource | `string` | `""` | no |
| <a name="input_private_cidr_a"></a> [private\_cidr\_a](#input\_private\_cidr\_a) | private subnet a CIDR block | `string` | `""` | no |
| <a name="input_private_cidr_b"></a> [private\_cidr\_b](#input\_private\_cidr\_b) | private subnet b CIDR block | `string` | `""` | no |
| <a name="input_private_cidr_c"></a> [private\_cidr\_c](#input\_private\_cidr\_c) | private subnet c CIDR block | `string` | `""` | no |
| <a name="input_pub_cidr_a"></a> [pub\_cidr\_a](#input\_pub\_cidr\_a) | public subnet a CIDR block | `string` | `""` | no |
| <a name="input_pub_cidr_b"></a> [pub\_cidr\_b](#input\_pub\_cidr\_b) | public subnet b CIDR block | `string` | `""` | no |
| <a name="input_pub_cidr_c"></a> [pub\_cidr\_c](#input\_pub\_cidr\_c) | public subnet c CIDR block | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR block | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_a"></a> [private\_subnet\_a](#output\_private\_subnet\_a) | output private subnets IDs to be used for creating ECS service that will deploy containers in private subnet |
| <a name="output_private_subnet_b"></a> [private\_subnet\_b](#output\_private\_subnet\_b) | n/a |
| <a name="output_private_subnet_c"></a> [private\_subnet\_c](#output\_private\_subnet\_c) | n/a |
| <a name="output_pub_subnet_id_a"></a> [pub\_subnet\_id\_a](#output\_pub\_subnet\_id\_a) | output public subnets IDs to be used for creating ALB |
| <a name="output_pub_subnet_id_b"></a> [pub\_subnet\_id\_b](#output\_pub\_subnet\_id\_b) | n/a |
| <a name="output_pub_subnet_id_c"></a> [pub\_subnet\_id\_c](#output\_pub\_subnet\_id\_c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
