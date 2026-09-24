# =============================================================
# modules/webapp/outputs.tf
# The module's "return values" — like a function's return.
# Whoever calls this module accesses these via
# module.<call_name>.<output_name>
# =============================================================

output "public_ip" {
  description = "Public IP of the EC2 instance this module created"
  value       = aws_instance.this.public_ip
}

output "bucket_name" {
  description = "Name of the S3 bucket this module created"
  value       = aws_s3_bucket.this.bucket
}

output "web_url" {
  description = "URL to visit the deployed web server"
  value       = "http://${aws_instance.this.public_ip}"
}
