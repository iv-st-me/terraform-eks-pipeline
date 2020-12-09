
# Route Table Route

resource "aws_route" "this" {
  count = length(var.routes)

  route_table_id         = lookup(element(var.routes, count.index), "route_table_id")
  destination_cidr_block = lookup(element(var.routes, count.index), "destination_cidr_block")
  gateway_id             = lookup(element(var.routes, count.index), "gateway_id")

  timeouts {
    create = "5m"
  }
}
