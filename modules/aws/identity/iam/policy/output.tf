output "id" {
  description = "Policy ID"
  value       = aws_iam_policy.this.id
}

output "arn" {
  description = "ARN assigned by AWS to policy"
  value       = aws_iam_policy.this.arn
}

output "description" {
  description = "Description of the policy"
  value       = aws_iam_policy.this.description
}

output "name" {
  description = "Name of the policy"
  value       = aws_iam_policy.this.name
}

output "path" {
  description = "Path of the policy in IAM"
  value       = aws_iam_policy.this.path
}

output "policy" {
  description = "Policy document"
  value       = aws_iam_policy.this.policy
}
