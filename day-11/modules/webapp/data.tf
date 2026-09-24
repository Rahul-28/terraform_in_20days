# =============================================================
# modules/webapp/data.tf
# Looks up the current AMI — same pattern as Day 9, now living
# INSIDE the module so callers don't need to know about it.
# =============================================================

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
