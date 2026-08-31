# =============================================================
# provider.tf
# Tells Terraform which platform to talk to (AWS) and which
# plugin version to use.
# =============================================================

terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # change to your preferred region

  # Credentials are picked up automatically from:
  # AWS CLI config (`aws configure`), env vars, or an IAM role.
  # Never hardcode keys here.
}
