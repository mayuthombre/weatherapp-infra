# Give the bucket name
output "bucket_name" {
  description = "The name of the bucket"
  value       = ["${module.s3_bucket.s3_bucket_name}"]
}

# Output bucket ARN
output "bucket_name_arn" {
  description = "Bucket ARN"
  value       = ["${module.s3_bucket.s3_bucket_name_arn}"]
}
