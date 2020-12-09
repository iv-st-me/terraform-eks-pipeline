
# EKS Cluster
resource "aws_eks_cluster" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.eks_cluster_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.eks_cluster_tier_name),
  )

  role_arn                  = var.role_arn
  enabled_cluster_log_types = var.eks_cluster_enabled_log_types
  version                   = var.eks_cluster_version

  vpc_config {
    endpoint_private_access = local.endpoint_private_access
    endpoint_public_access  = local.endpoint_public_access
    security_group_ids      = var.security_group_ids
    subnet_ids              = var.eks_cluster_subnet_ids
  }

  tags = merge(
    var.common_tags,
    var.eks_cluster_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.eks_cluster_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.eks_cluster_tier_name),
      )
    },
  )
}
