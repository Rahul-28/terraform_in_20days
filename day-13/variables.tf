variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name, used in naming convention"
  type        = string
  default     = "terraform-learning"
}

variable "environment" {
  description = "Environment tag (dev, staging, prod) — drives the conditional below"
  type        = string
  default     = "dev"
}

# ---------------------------------------------------------
# List of maps -> fuel for the dynamic block.
# Add/remove entries here; the security group resource block
# itself never needs to change.
# ---------------------------------------------------------
variable "ingress_rules" {
  description = "Ports and CIDR ranges to allow inbound"
  type = list(object({
    port = number
    cidr = string
  }))
  default = [
    { port = 80, cidr = "0.0.0.0/0" },  # HTTP
    { port = 443, cidr = "0.0.0.0/0" }, # HTTPS
    { port = 22, cidr = "10.0.0.0/16" } # SSH, internal only
  ]
}

variable "extra_tags" {
  description = "Extra tags to merge() with common_tags"
  type        = map(string)
  default = {
    Owner = "platform-team"
  }
}
