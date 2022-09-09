# terraform {
#   required_version = ">= 0.13.0"
#   backend "s3" {
#     bucket = "pathways-dojo"
#     key    = "mayu-tfstate-main"
#     region = "us-east-1"
#   }
# }


terraform {
  backend "local" {
    path = "./terraform/terraform.tfstate"
  }
}