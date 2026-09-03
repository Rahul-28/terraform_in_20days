# =============================================================
# outputs.tf
# The "receipt" — printed once terraform apply finishes.
# Run `terraform output` to see all of these, or
# `terraform output <name>` for just one (useful in scripts).
# =============================================================

output "bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.demo_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.demo_bucket.arn
}

output "server_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.demo_server.public_ip
}

output "server_id" {
  description = "Instance ID of the EC2 server"
  value       = aws_instance.demo_server.id
}

output "resource_name_prefix" {
  description = "The naming convention used across all resources"
  value       = local.name_prefix
}
