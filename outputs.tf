# outputs.tf - Output values

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.example.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "Region where the S3 bucket is created"
  value       = aws_s3_bucket.example.region
}
