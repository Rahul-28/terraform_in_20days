terraform state list

aws_instance.demo_server
aws_s3_bucket.demo_bucket

terraform state show aws_s3_bucket.demo_bucket

# aws_s3_bucket.demo_bucket:
resource "aws_s3_bucket" "demo_bucket" {
    acceleration_status         = null
    arn                         = "arn:aws:s3:::terraform-learning-dev-bucket-2026"
    bucket                      = "terraform-learning-dev-bucket-2026"
    bucket_domain_name          = "terraform-learning-dev-bucket-2026.s3.amazonaws.com"
    bucket_prefix               = null
    bucket_regional_domain_name = "terraform-learning-dev-bucket-2026.s3.us-east-1.amazonaws.com"
    force_destroy               = false
    hosted_zone_id              = "Z3AQBSTGFYJSTF"
    id                          = "terraform-learning-dev-bucket-2026"
    object_lock_enabled         = false
    policy                      = null
    region                      = "us-east-1"
    request_payer               = "BucketOwner"
    tags                        = {
        "Day"         = "6"
        "Environment" = "dev"
        "ManagedBy"   = "terraform"
        "Project"     = "terraform-learning"
    }
    tags_all                    = {
        "Day"         = "6"
        "Environment" = "dev"
        "ManagedBy"   = "terraform"
        "Project"     = "terraform-learning"
    }

    grant {
        id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
        permissions = [
            "FULL_CONTROL",
        ]
        type        = "CanonicalUser"
        uri         = null
    }

    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = false

            apply_server_side_encryption_by_default {
                kms_master_key_id = null
                sse_algorithm     = "AES256"
            }
        }
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}