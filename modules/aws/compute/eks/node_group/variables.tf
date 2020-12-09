variable "eks_cluster_resource_prefix" {
  type        = string
  description = "Prefix name for EKS Cluster object"
}

variable "environment_name" {
  type        = string
  description = "Reference name of the environment"
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "Tier name for EKS Cluster object"
}

variable "eks_node_group_tier_name" {
  type        = string
  description = "Tier name for EKS Node Group object"
}

variable "eks_node_group_resource_prefix" {
  type        = string
  description = "Prefix name for EKS Node Group object"
}

variable "node_role_arn" {
  type        = string
  description = "ARN of IAM role that provides permissions for Kubernetes Node Group to make calls to AWS API operations on behalf of the user"
}

variable "scaling_config_desired_size" {
  type        = number
  description = "Desired number of Worker Nodes"
}

variable "scaling_config_max_size" {
  type        = number
  description = "Maximum number of Worker Nodes"
}

variable "scaling_config_min_size" {
  type        = number
  description = "Minimum number of Worker Nodes"
}

variable "subnet_ids" {
  type        = list(string)
  description = "IDs of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME, where CLUSTER_NAME is the name of the EKS Cluster"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to all resources"
}

variable "eks_node_group_tags" {
  type        = map(string)
  description = "Mapof tags to assign to EKS Node Group"
}
