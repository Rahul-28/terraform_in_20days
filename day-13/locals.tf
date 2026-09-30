locals {
  name_prefix = "${var.project}-${var.environment}"

  # merge() — combine two maps into one. Later keys win on conflict.
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "terraform"
      Day         = "13"
    },
    var.extra_tags
  )

  # lookup() — safely fetch a value from a map, with a fallback
  # if the key doesn't exist, instead of erroring out.
  instance_size_map = {
    dev  = "t2.micro"
    prod = "t3.medium"
  }
  resolved_instance_type = lookup(local.instance_size_map, var.environment, "t2.micro")
}
