output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "vpc_arn" {
  value       = aws_vpc.this.arn
  description = "ARN of VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.this.cidr_block
  description = "CIDR block of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "ID list of public subnets"
}

output "public_subnet_arns" {
  value       = aws_subnet.public.*.arn
  description = "ARN list of public subnets"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "ID list of private subnets"
}

output "private_subnet_arns" {
  value       = aws_subnet.private.*.arn
  description = "ARN list of private subnets"
}

output "data_subnet_ids" {
  value       = aws_subnet.data.*.id
  description = "ID list of data subnets"
}

output "data_subnet_arns" {
  value       = aws_subnet.data.*.arn
  description = "ARN list of private subnets"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of routing table for public subnets"
}

output "private_route_table_id" {
  value       = aws_route_table.private.*.id
  description = "ID of routing table for private subnets"
}

output "data_route_table_id" {
  value       = aws_route_table.data.*.id
  description = "ID of routing table for data subnets"
}
