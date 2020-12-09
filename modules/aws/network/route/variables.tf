variable "routes" {
  type        = list(map(string))
  description = "List of maps, of routes to add to specified route table. Keys route_table_id, destination_cidr_block and gateway_id are mandatory"
}
