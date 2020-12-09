variable "eks_cluster_resource_prefix" {
  type        = string
  description = "Prefix name for EKS Cluster"
}

variable "environment_name" {
  type        = string
  description = "Reference name of the current environment"
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "Tier name convention for EKS Cluster"
}

variable "role_arn" {
  type        = string
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of SG IDs for the cross account ENI that EKS creates to use to allow communication between WN and the Kubernetes control plane"
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs in at least two AZ"
}

variable "eks_cluster_enabled_log_types" {
  type        = list(string)
  description = "List EKS control plane log types to enable"
}

variable "eks_cluster_version" {
  type        = string
  description = "Kubernetes cluster version"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to resources"
}

variable "eks_cluster_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS Cluster"
}
