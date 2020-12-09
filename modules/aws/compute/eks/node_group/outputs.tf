output "id" {
  description = "EKS Cluster name and EKS Node Group name separated by :"
  value       = aws_eks_node_group.this.id
}

output "arn" {
  description = "ARN of EKS Node Group"
  value       = aws_eks_node_group.this.arn
}

output "resources" {
  description = "List of map containing information for underlying resources - autoscaling_groups is list of objects containing information about AutoScaling Groups; name is a string of the AutoScaling Group name; remote_access_security_group_id is string identifier of the remote access EC2 Security Group"
  value       = aws_eks_node_group.this.resources
}

output "status" {
  description = "Status of the EKS Node Group"
  value       = aws_eks_node_group.this.status
}
