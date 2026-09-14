# =============================================================
# backend-setup.tf
# Run this FIRST, with local state, to create the S3 bucket +
# DynamoDB table that will store/lock your state.
#
# (Chicken-and-egg note: you can't store state in a backend that
# doesn't exist yet — so this piece runs with local state first,
# then you migrate everything else to use it.)
# =============================================================

resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-day8-state-bucket-2026" # must be globally unique

  # Prevent accidental deletion of your state bucket
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled" # keeps history of every state file version — lets you roll back
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # state can contain secrets — always encrypt at rest
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-day8-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" # required attribute name for Terraform locking

  attribute {
    name = "LockID"
    type = "S"
  }
}
