data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_policy" "amazon_eks_cluster_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "amazon_eks_service_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

data "aws_vpc" "current" {
  filter {
    name = "tag:Name"
    values = [
      format(
        "%s-%s-%s",
        lower(var.vpc_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      ),
    ]
  }
  state = "available"
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.current.id

  filter {
    name = "tag:Name"
    values = [
      format(
        "%s-%s-%s-%s",
        lower(var.subnet_resource_prefix),
        "*",
        lower(var.environment_name),
        lower(var.private_subnet_tier_name),
      )
    ]
  }
}

data "aws_iam_policy" "amazon_eks_worker_node_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "amazon_ec2_container_registry_ro_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy" "amazon_eks_cni_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
