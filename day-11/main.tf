# =============================================================
# main.tf (ROOT MODULE)
# Composition in action: a REGISTRY module (VPC) feeds its
# outputs into a LOCAL module (webapp) as inputs. Two
# independently-owned pieces, wired together here.
# =============================================================

# --- REGISTRY MODULE ---
# source points to the public Terraform Registry, not a local path.
# version is PINNED — never leave this unpinned in real projects.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${local.name_prefix}-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway      = true
  single_nat_gateway      = true # cheaper for learning; use per-AZ NAT in real prod
  map_public_ip_on_launch = true # so instances in public subnets actually get a public IP

  tags = local.common_tags
}

# --- LOCAL MODULE ---
# Same webapp module from Day 10, now placed inside the VPC
# the registry module just built — module.vpc's outputs become
# module.webapp_blue's inputs.
module "webapp_blue" {
  source = "./modules/webapp"

  name_prefix   = "${local.name_prefix}-blue"
  instance_type = "t2.micro"
  common_tags   = merge(local.common_tags, { Variant = "blue" })

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets[0]
}
