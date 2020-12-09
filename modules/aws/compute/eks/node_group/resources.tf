
# EKS Node Group
resource "aws_eks_node_group" "this" {
  cluster_name = format(
    "%s-%s-%s-%s",
    lower(var.eks_cluster_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.eks_cluster_tier_name),
  )

  node_group_name = format(
    "%s-%s-%s-%s",
    lower(var.eks_node_group_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.eks_node_group_tier_name),
  )

  node_role_arn = var.node_role_arn

  scaling_config {
    desired_size = var.scaling_config_desired_size
    max_size     = var.scaling_config_max_size
    min_size     = var.scaling_config_min_size
  }

  subnet_ids = var.subnet_ids

  tags = merge(
    var.common_tags,
    var.eks_node_group_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.eks_node_group_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.eks_node_group_tier_name),
      )
    },
  )
}
