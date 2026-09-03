# =============================================================
# main.tf
# Every resource name/tag below traces back to ONE local value
# (local.name_prefix) instead of repeating var.project and
# var.environment in six different places.
# =============================================================

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "${local.name_prefix}-bucket-2026"
  tags   = local.common_tags
}

resource "aws_instance" "demo_server" {
  ami           = "ami-0c55b159cbfafe1f0" # verify current AMI for your region
  instance_type = var.instance_type

  tags = merge(
    local.common_tags,
    {
      Name         = "${local.name_prefix}-server"
      LinkedBucket = aws_s3_bucket.demo_bucket.id
    }
  )
}
