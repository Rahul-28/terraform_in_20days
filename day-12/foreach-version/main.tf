# =============================================================
# FOR_EACH VERSION
# Resources are keyed by NAME: server["web-1"], server["web-2"], etc.
#
# TRY THIS:
# 1. Apply with all 3 entries below.
# 2. Remove "web-2" (the MIDDLE entry) from the map.
# 3. Run terraform plan.
#    -> Notice ONLY server["web-2"] is destroyed. "web-1" and
#       "web-3" are completely untouched, because they're
#       identified by NAME, not position.
# =============================================================

variable "servers" {
  description = "Map of server name -> instance type. Each entry is independent."
  type        = map(string)
  default = {
    "web-1" = "t2.micro"
    "web-2" = "t2.micro"
    "web-3" = "t2.small"
  }
}

resource "aws_instance" "server" {
  for_each = var.servers

  ami           = "ami-0c55b159cbfafe1f0" # verify current AMI for your region
  instance_type = each.value             # the map's VALUE

  tags = {
    Name = each.key # the map's KEY — this becomes the resource's identity
  }
}

output "instance_addresses" {
  description = "Resource addresses — notice they're keyed by NAME, not position"
  value       = { for key, inst in aws_instance.server : key => inst.instance_type }
}
