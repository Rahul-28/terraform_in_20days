# =============================================================
# backend.tf
# Add this to your Day 6/7 project (NOT the backend-setup
# folder) to point Terraform at the remote backend you just
# created. Backend blocks can't use variables — values must be
# hardcoded or passed via -backend-config.
#
# After adding this, run: terraform init
# Terraform will detect existing local state and ask:
# "Do you want to copy existing state to the new backend?"
# Answer: yes
# =============================================================

terraform {
  backend "s3" {
    bucket         = "terraform-day8-state-bucket-2026" # from backend-setup.tf
    key            = "day8/terraform.tfstate"           # path WITHIN the bucket
    region         = "ap-south-1"
    dynamodb_table = "terraform-day8-lock-table" # from backend-setup.tf
    encrypt        = true
  }
}
