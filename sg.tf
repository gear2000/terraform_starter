resource "aws_security_group" "web" {
  name        = "web"
  description = "allow http and ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    {
      Name    = "${var.vpc_name}-web-sg"
      Product = "security-group"
    },
  )
}

output "security_group_id" {
  description = "id of the web server security group"
  value       = aws_security_group.web.id
}
