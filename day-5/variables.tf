# =============================================================
# variables.tf
# Declares the "blanks" in the form — what inputs this config
# expects, their types, and (optionally) default values.
# =============================================================

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"

  # Validation block: rejects bad input BEFORE apply ever runs.
  validation {
    condition     = contains(["t2.micro", "t2.small", "t3.micro"], var.instance_type)
    error_message = "instance_type must be one of: t2.micro, t2.small, t3.micro."
  }
}

variable "environment" {
  description = "Environment tag (dev, staging, prod)"
  type        = string
  default     = "dev"
}
