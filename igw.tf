resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    {
      Name    = "${var.vpc_name}-internet-gateway"
      Product = "internet-gateway"
    }
  )

}

output "internet_gateway_ids" { value = join(",", aws_internet_gateway.default[*].id) }