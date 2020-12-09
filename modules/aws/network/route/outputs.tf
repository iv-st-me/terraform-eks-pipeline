output "route_id" {
  value       = aws_route.this.*.id
  description = "Route Table identifier and destination"
}
