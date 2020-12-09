locals {
  eip_in_vpc = true

  default_ipv4_route = "0.0.0.0/0"

  eks_cluster_name = format(
    "%s-%s-%s-%s",
    lower(var.eks_cluster_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.eks_cluster_tier_name),
  )
}
