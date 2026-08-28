# =============================================================
# provider.tf
# Purpose: Tells Terraform WHICH platform to talk to (AWS here)
# and WHICH version of that plugin to use.
# =============================================================

terraform {
  # required_version pins the Terraform CLI version this config
  # is known to work with. Prevents "works on my machine" issues.
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      # source = where Terraform downloads the provider plugin from
      source = "hashicorp/aws"

      # version = which version(s) of the plugin are allowed
      # "~> 5.0" means: any 5.x version, but not 6.0+
      version = "~> 5.0"
    }
  }
}

# The provider block itself = actual configuration for AWS.
# This is where Terraform learns things like which region to use.
provider "aws" {
  region = "ap-south-1" # Mumbai region — change to your preferred region

  # NOTE: Never hardcode access_key / secret_key here.
  # Terraform automatically picks up credentials from:
  #   1. Environment variables (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY)
  #   2. AWS CLI config (~/.aws/credentials) via `aws configure`
  #   3. IAM roles (recommended in real cloud environments)
}

