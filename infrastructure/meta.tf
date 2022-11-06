terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    bucket = "pathways-dojo"
    key    = "mayu-tfstate-blue"
    region = "us-east-1"
  }
}