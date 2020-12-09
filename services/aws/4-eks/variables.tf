variable "common_region" {
  type        = string
  description = "The Region where to create resources"
}

variable "account_id" {
  type        = string
  description = "Account ID for the account"
}

variable "terraform_assume_role_name" {
  type        = string
  description = "Role name to be assumed"
}

variable "iam_policy_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Policy object"
}

variable "environment_name" {
  type        = string
  description = "Reference name of the environment"
}

variable "eks_master_tier_name" {
  type        = string
  description = "Tier name for EKS Cluster object"
}

variable "eks_master_iam_role_policy_path" {
  type        = string
  description = "Path in which to create the policy for EKS master nodes"
}

variable "iam_role_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Role"
}

variable "eks_master_iam_role_path" {
  type        = string
  description = "Path of EKS master nodes IAM Role"
}

variable "eks_master_iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds to set for specified IAM role. Vvalue from 1 hour to 12 hours. Default is 1 hour"
}

variable "eks_master_iam_role_permissions_boundary" {
  type        = string
  description = "ARN of policy that is used to set permissions boundary for IAM role"
}

variable "common_tags" {
  type        = map(string)
  description = "Mapof tags to assign to all resources"
}

variable "eks_master_iam_role_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS master nodes IAM Role"
}

variable "eks_master_kms_key_deletion_window_in_days" {
  type        = number
  description = "How many days after which the key for EKS master nodes is deleted after deletion of resource. Value between 7 and 30 days"
}

variable "kms_key_tags" {
  type        = map(string)
  description = "Map of tags to assign to KMS Key"
}

variable "kms_key_resource_prefix" {
  type        = string
  description = "Prefix name for KMS Key object"
}

variable "security_group_resource_prefix" {
  type        = string
  description = "Prefix name for Security Group object"
}

variable "vpc_resource_prefix" {
  type        = string
  description = "Prefix name for Network VPC object"
}

variable "security_group_tags" {
  type        = map(string)
  description = "Map of tags to assign to Security Group"
}

variable "eks_master_security_group_custom_ingress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of Ingress rules to set on EKS master nodes Security Group"
}

variable "eks_master_security_group_custom_egress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of Egress rules to set on EKS worker nodes Security Group"
}

variable "eks_cluster_resource_prefix" {
  type        = string
  description = "Prefix name for EKS Cluster object"
}

variable "eks_node_group_resource_prefix" {
  type        = string
  description = "Prefix name for EKS Node Group object"
}

variable "subnet_resource_prefix" {
  type        = string
  description = "Prefix name for Network Private Subnets object"
}

variable "private_subnet_tier_name" {
  type        = string
  description = "Tier name convention for Private Subnet object"
}

variable "eks_cluster_enabled_log_types" {
  type        = list(string)
  description = "List of EKS control plane log types to enable"
}

variable "eks_cluster_version" {
  type        = string
  description = "Kubernetes cluster master version"
}

variable "eks_cluster_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS Cluster"
}

variable "eks_worker_tier_name" {
  type        = string
  description = "Tier name for EKS Worker node object"
}

variable "eks_worker_iam_role_policy_path" {
  type        = string
  description = "Path where to create the policy for EKS worker nodes"
}

variable "eks_worker_iam_role_path" {
  type        = string
  description = "Path where to create the IAM Role for EKS worker nodes"
}

variable "eks_worker_iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds to set for specified IAM role. Vvalue from 1 hour to 12 hours. Default is 1 hour"
}

variable "eks_worker_iam_role_permissions_boundary" {
  type        = string
  description = "ARN of policy that is used to set permissions boundary for IAM role"
}

variable "eks_worker_iam_role_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS worker nodes IAM Role"
}

variable "eks_worker_kms_key_deletion_window_in_days" {
  type        = number
  description = "How many days after which the key for EKS master nodes is deleted after deletion of resource. Value between 7 and 30 days"
}

variable "eks_worker_security_group_custom_ingress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of Ingress rules to set on EKS Worker nodes Security Group"
}

variable "eks_worker_security_group_custom_egress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of Egress rules to set on EKS Worker nodes Security Group"
}

variable "eks_worker_max_size" {
  type        = number
  description = "Mximum size of auto scaling group"
}

variable "eks_worker_min_size" {
  type        = number
  description = "Minimum size of auto scaling group"
}

variable "eks_worker_desired_capacity" {
  type        = number
  description = "Number of EC2 instances that will be running in the Worker group"
}

variable "eks_node_group_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS Node Group resource"
}
