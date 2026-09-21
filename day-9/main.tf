# =============================================================
# main.tf
# Notice: no hardcoded AMI ID anymore. It comes from the
# data source in data.tf, resolved fresh at plan time.
# =============================================================

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "${local.name_prefix}-bucket-2026"
  tags   = local.common_tags
}

# Security group allowing HTTP in, so we can see the user_data
# web server actually working.
resource "aws_security_group" "web" {
  name        = "${local.name_prefix}-web-sg"
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
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-web-sg" })
}

resource "aws_instance" "demo_server" {
  # AMI resolved dynamically — correct for whatever region you're in
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web.id]

  # user_data = the RECOMMENDED alternative to remote-exec.
  # Runs at boot, handled by the cloud provider, not by Terraform
  # holding an SSH connection open and hoping it works.
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Day 9 - deployed by Terraform</h1>" > /var/www/html/index.html
  EOF

  tags = merge(
    local.common_tags,
    {
      Name         = "${local.name_prefix}-server"
      LinkedBucket = aws_s3_bucket.demo_bucket.id
    }
  )

  # ---------------------------------------------------------
  # PROVISIONER EXAMPLE — commented out ON PURPOSE.
  # HashiCorp calls provisioners a last resort. Uncomment only
  # to observe the behavior; prefer user_data above in practice.
  #
  # local-exec runs on YOUR machine, not the server:
  # provisioner "local-exec" {
  #   command = "echo Instance ${self.id} created at ${timestamp()} >> created.log"
  # }
  #
  # remote-exec runs ON the server via SSH (needs a key pair,
  # open port 22, and a reachable public IP — lots of ways to fail):
  # provisioner "remote-exec" {
  #   inline = ["sudo yum install -y git"]
  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = file("~/.ssh/my-key.pem")
  #     host        = self.public_ip
  #   }
  # }
  # ---------------------------------------------------------
}
