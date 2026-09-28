# =============================================================
# COUNT VERSION
# Resources are numbered by POSITION: server[0], server[1], server[2]
#
# TRY THIS:
# 1. Apply with all 3 names below.
# 2. Remove "web-2" (the MIDDLE entry) from server_names.
# 3. Run terraform plan.
#    -> Notice it doesn't just remove index 1. Because index 2
#       ("web-3") now shifts into index 1's position, Terraform
#       sees index 1 and 2 as "changed" and wants to destroy +
#       recreate them, even though "web-3" itself never should
#       have been touched.
# =============================================================

variable "server_names" {
  description = "Names for tagging — order matters here, that's the point"
  type        = list(string)
  default     = ["web-1", "web-2", "web-3"]
}

resource "aws_instance" "server" {
  count = length(var.server_names)

  ami           = "ami-0c55b159cbfafe1f0" # verify current AMI for your region
  instance_type = "t2.micro"

  tags = {
    Name = var.server_names[count.index] # position-based lookup
  }
}

output "instance_addresses" {
  description = "Resource addresses — notice they're numbered, not named"
  value       = { for idx, inst in aws_instance.server : idx => inst.tags["Name"] }
}
