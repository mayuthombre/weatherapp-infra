module "locals" {
  source = "../locals"
}

### Define Variables
variable "bucket" {
  default     = ""
}

variable "tags" {
  default     = {}
}

### Create S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-bucket"
    }
  )
  
}

### Define Output
output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.id
}

output "s3_bucket_name_arn" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.arn
}