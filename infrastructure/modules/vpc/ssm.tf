# # Save details in SSM for other stacks
# resource "aws_ssm_parameter" "vpc_id" {
#   name  = "/${module.locals.name}/vpc-id"
#   type  = "String"
#   value = aws_vpc.vpc.id

#   tags = merge(
#     module.locals.tags,
#     {
#       Name = "${module.locals.name}-ssm"
#     }
#   )
# }