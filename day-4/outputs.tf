# =============================================================
# outputs.tf
# Prints useful values after `terraform apply` instead of
# making you dig through the AWS console.
# =============================================================

output "bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.demo_bucket.bucket
}

output "server_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.demo_server.public_ip
}
