# =============================================================
# modules/webapp/variables.tf
# The module's "inputs" — like a function's parameters.
# Whoever CALLS this module must (or can optionally) provide these.
# =============================================================

variable "name_prefix" {
  description = "Naming prefix for all resources this module creates"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "common_tags" {
  description = "Tags applied to every resource in this module"
  type        = map(string)
  default     = {}
}
