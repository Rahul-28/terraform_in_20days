# =============================================================
# modules/webapp/main.tf
# The module's "logic" — the actual resources it creates.
# This complexity is now HIDDEN from whoever calls the module.
# =============================================================

resource "aws_s3_bucket" "this" {
  bucket = "${var.name_prefix}-bucket-2026"
  tags   = var.common_tags
}

resource "aws_security_group" "web" {
  name        = "${var.name_prefix}-web-sg"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, { Name = "${var.name_prefix}-web-sg" })
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>${var.name_prefix} - deployed via module</h1>" > /var/www/html/index.html
  EOF

  tags = merge(
    var.common_tags,
    {
      Name         = "${var.name_prefix}-server"
      LinkedBucket = aws_s3_bucket.this.id
    }
  )
}
