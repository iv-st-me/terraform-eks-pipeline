output "arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.this.arn
}

output "name" {
  description = "Name of the IAM Role"
  value       = aws_iam_role.this.name
}

output "id" {
  description = "ID of the IAM Role"
  value       = aws_iam_role.this.id
}
