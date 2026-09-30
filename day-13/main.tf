# =============================================================
# main.tf
# Two things to notice:
# 1. The dynamic "ingress" block replaces what would've been
#    3+ hand-written ingress {} blocks.
# 2. instance_type uses a ternary conditional — no if/else
#    statement exists in HCL, this is the declarative equivalent.
# =============================================================

resource "aws_security_group" "web" {
  name        = "${local.name_prefix}-web-sg"
  description = "Allow inbound traffic based on ingress_rules variable"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = "Allow port ${ingress.value.port}"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-web-sg" })
}

resource "aws_instance" "demo_server" {
  ami = "ami-0c55b159cbfafe1f0" # verify current AMI for your region

  # CONDITIONAL: condition ? true_value : false_value
  # prod gets a bigger instance, everything else gets the small one —
  # same resource block, no duplication.
  instance_type = var.environment == "prod" ? "t3.medium" : local.resolved_instance_type

  vpc_security_group_ids = [aws_security_group.web.id]

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-server" })
}
