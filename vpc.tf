resource "aws_vpc" "main" {
  cidr_block           = "${var.base_cidr}.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    {
      Name    = var.vpc_name
      Product = "vpc"
    },
  )

}

output "vpc_id" { value = aws_vpc.main.id }
output "vpc_name" { value = aws_vpc.main.tags.Name }
