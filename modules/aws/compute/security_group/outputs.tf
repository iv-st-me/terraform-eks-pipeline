output "id" {
  description = "ID of the Security Group"
  value       = aws_security_group.this.id
}

output "arn" {
  description = "ARN of the Security Group"
  value       = aws_security_group.this.arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_security_group.this.vpc_id
}

output "name" {
  description = "Name of the Security Group"
  value       = aws_security_group.this.name
}
