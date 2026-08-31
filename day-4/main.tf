# =============================================================
# main.tf
# Goal: See resource block anatomy + an IMPLICIT dependency
# in action. No depends_on needed here — Terraform detects the
# link automatically because aws_instance references the bucket.
# =============================================================

# resource "<TYPE>" "<LOCAL_NAME>" { ... }
#   TYPE       -> defined by the AWS provider (what kind of thing)
#   LOCAL_NAME -> your own reference name, used only within this code

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "terraform-day4-demo-bucket-2026" # must be globally unique

  tags = {
    Environment = "learning"
    Day         = "4"
  }
}

# This resource REFERENCES demo_bucket.id below.
# That reference is what creates the IMPLICIT dependency —
# Terraform automatically creates the bucket first, then this.
resource "aws_instance" "demo_server" {
  ami           = "ami-0c55b159cbfafe1f0" # verify current AMI for your region
  instance_type = "t2.micro"              # free-tier eligible

  tags = {
    Name         = "terraform-day4-server"
    LinkedBucket = aws_s3_bucket.demo_bucket.id # <-- implicit dependency happens here
  }
}
