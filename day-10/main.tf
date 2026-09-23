# =============================================================
# main.tf (ROOT MODULE)
# Look how small this is compared to Day 9's main.tf.
# All the S3/security-group/EC2 complexity now lives inside
# modules/webapp — this file just CALLS it with different inputs.
# =============================================================

module "webapp_blue" {
  source = "./modules/webapp" # local path to the child module

  name_prefix   = "${local.name_prefix}-blue"
  instance_type = "t2.micro"
  common_tags   = merge(local.common_tags, { Variant = "blue" })
}

module "webapp_green" {
  source = "./modules/webapp"

  name_prefix   = "${local.name_prefix}-green"
  instance_type = "t2.small"
  common_tags   = merge(local.common_tags, { Variant = "green" })
}
