output "arn" {
  description = "ARN of the key"
  value       = aws_kms_key.this.arn
}

output "id" {
  description = "Globally unique identifier for the key"
  value       = aws_kms_key.this.key_id
}

output "alias_arn" {
  description = "ARN of the key alias"
  value       = aws_kms_alias.this.arn
}
