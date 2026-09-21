# =============================================================
# data.tf
# DATA SOURCES = read something that already exists.
# Terraform never creates, modifies, or destroys these —
# it just looks up current information at plan time.
# =============================================================

# Look up the most recent Amazon Linux 2 AMI, instead of
# hardcoding an ID that goes stale and is region-specific.
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # only trust official Amazon-published images

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Look up the availability zones available in the current region.
# Useful later for spreading resources across AZs.
data "aws_availability_zones" "available" {
  state = "available"
}

# Look up details about the AWS account/identity Terraform is using.
# Handy for building ARNs or tagging with account ID.
data "aws_caller_identity" "current" {}
