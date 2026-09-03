# =============================================================
# locals.tf
# The "sticky note" — computed once, referenced everywhere.
# Change the naming pattern in ONE place, and every resource
# that uses `local.name_prefix` updates automatically.
# =============================================================

locals {
  # Single source of truth for naming convention
  name_prefix = "${var.project}-${var.environment}"

  # Common tags applied to every resource — define once, reuse everywhere
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
    Day         = "6"
  }
}
