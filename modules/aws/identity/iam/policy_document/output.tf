output "json" {
  description = "The policy document statements serialized as JSON policy document"
  value       = data.aws_iam_policy_document.this.json
}
