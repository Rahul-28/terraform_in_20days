# =============================================================
# main.tf
# Same S3 + EC2 setup as Day 4, but now powered by variables
# instead of hardcoded values. Structure stays fixed — only
# the "blanks" (var.xxx) change per environment.
# =============================================================

resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    Day         = "5"
  }
}

resource "aws_instance" "demo_server" {
  ami           = "ami-0c55b159cbfafe1f0" # verify current AMI for your region
  instance_type = var.instance_type

  tags = {
    Name         = "terraform-day5-server-${var.environment}"
    LinkedBucket = aws_s3_bucket.demo_bucket.id
  }
}
