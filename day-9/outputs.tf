output "resolved_ami_id" {
  description = "The AMI ID the data source looked up — notice it's NOT hardcoded"
  value       = data.aws_ami.amazon_linux.id
}

output "resolved_ami_name" {
  description = "Human-readable name of the AMI that was selected"
  value       = data.aws_ami.amazon_linux.name
}

output "available_azs" {
  description = "Availability zones available in the current region"
  value       = data.aws_availability_zones.available.names
}

output "aws_account_id" {
  description = "The AWS account Terraform is operating in"
  value       = data.aws_caller_identity.current.account_id
}

output "web_url" {
  description = "Visit this after apply to see the user_data web server"
  value       = "http://${aws_instance.demo_server.public_ip}"
}

output "bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.demo_bucket.bucket
}
