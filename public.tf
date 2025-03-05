resource "aws_subnet" "public" {
  count                   = var.num_of_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.base_cidr}.10${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    var.public_subnet_labels,
    {
      Name               = "${var.vpc_name}-service-public-${substr(data.aws_availability_zones.available.names[count.index], -1, 1)}"
      subnet_environment = "public"
    },
  )
}

resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.main.main_route_table_id

  tags = merge(
    var.cloud_labels,
    var.vpc_labels,
    {
      Name    = "${var.vpc_name}-route-public"
      Product = "route-table"
    },
  )
}

resource "aws_route" "public_internet_gateway" {
  count                  = var.num_of_subnets
  route_table_id         = aws_default_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id

  timeouts {
    create = "5m"
  }
}

output "public_route_table_id" {
  description = "the id of the public route table"
  value       = aws_default_route_table.public.id
}

output "public_subnet_ids" {
  description = "comma separated list of public subnet ids"
  value       = join(",", aws_subnet.public[*].id)
}
