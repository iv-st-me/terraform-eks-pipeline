output "eks_id" {
  description = "Name of EKS cluster"
  value       = aws_eks_cluster.this.id
}

output "eks_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.this.arn
}

output "eks_certificate_authority_data" {
  description = "Base64 encoded certificate required to communicate with the EKS cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "eks_endpoint" {
  description = "Endpoint for EKS Kubernetes API"
  value       = aws_eks_cluster.this.endpoint
}

output "eks_identity" {
  description = "Identity provider information for the cluster"
  value       = aws_eks_cluster.this.identity
}

output "eks_platform_version" {
  description = "EKS version of the cluster"
  value       = aws_eks_cluster.this.platform_version
}

output "eks_status" {
  description = "Status of the EKS cluster"
  value       = aws_eks_cluster.this.status
}

output "eks_version" {
  description = "Kubernetes server version for the cluster"
  value       = aws_eks_cluster.this.version
}
