resource "aws_subnet" "private" {
  count             = var.num_of_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.base_cidr}.11${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    var.private_subnet_labels,
    {
      Name               = "${var.vpc_name}-service-private-${substr(data.aws_availability_zones.available.names[count.index], -1, 1)}"
      subnet_environment = "private"
    },
  )

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    {
      Name    = "${var.vpc_name}-route-private"
      Product = "route-table"
    },
  )

}

resource "aws_route_table_association" "private" {
  count          = var.num_of_subnets
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

output "private_route_table_id" { value = aws_route_table.private.id }
output "private_subnet_ids" { value = join(",", aws_subnet.private[*].id) }













