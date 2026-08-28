# =============================================================
# main.tf
# Purpose: Defines the actual infrastructure resources we want
# Terraform to create, update, or destroy.
# =============================================================

# ---------------------------------------------------------
# RESOURCE BLOCK ANATOMY:
# resource "<PROVIDER_RESOURCE_TYPE>" "<LOCAL_NAME>" {
#   argument = value
# }
#
# - PROVIDER_RESOURCE_TYPE -> what kind of thing to create
#     (defined by the AWS provider, e.g. aws_s3_bucket)
# - LOCAL_NAME -> a name YOU choose, used only within this
#     Terraform config to reference this resource elsewhere
# ---------------------------------------------------------

# Example 1: An S3 bucket (simple, no cloud cost to worry about)
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-terraform-demo-bucket-2026" # must be globally unique across ALL AWS accounts

  tags = {
    Environment = "learning"
    ManagedBy   = "terraform"
  }
}

# Example 2: An EC2 instance that depends on the bucket above
# (implicit dependency — Terraform figures out the order automatically
# because we reference demo_bucket.id below)
resource "aws_instance" "demo_server" {
  ami           = "ami-0c55b159cbfafe1f0" # example Amazon Linux AMI - verify current AMI for your region
  instance_type = "t2.micro"              # free-tier eligible

  tags = {
    Name         = "terraform-demo-server"
    LinkedBucket = aws_s3_bucket.demo_bucket.id # implicit dependency
  }
}

# ---------------------------------------------------------
# OUTPUT BLOCK: prints useful info after `terraform apply`
# so you don't have to dig through the AWS console to find it.
# ---------------------------------------------------------
output "bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.demo_bucket.bucket
}

output "server_public_ip" {
  description = "Public IP of the demo EC2 instance"
  value       = aws_instance.demo_server.public_ip
}

