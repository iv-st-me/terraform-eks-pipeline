module "eks_master_iam_role_assume_role_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.eks_master_iam_assume_role_policy_document_statements
}

module "eks_master_iam_role" {
  source = "../../../modules/aws/identity/iam/role"

  iam_role_resource_prefix         = var.iam_role_resource_prefix
  environment_name                 = var.environment_name
  iam_role_tier_name               = var.eks_master_tier_name
  assume_role_policy_document_json = module.eks_master_iam_role_assume_role_policy_document.json
  path                             = var.eks_master_iam_role_path
  max_session_duration             = var.eks_master_iam_role_max_session_duration
  permissions_boundary             = var.eks_master_iam_role_permissions_boundary
  common_tags                      = var.common_tags
  iam_role_tags                    = var.eks_master_iam_role_tags
  aws_iam_role_policy_attachments  = local.eks_master_iam_role_policy_attachments
}

module "eks_master_kms_key_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.eks_master_kms_key_policy_document_statements
}

module "eks_master_kms_key" {
  source = "../../../modules/aws/identity/kms"

  description             = local.eks_master_kms_key_description
  key_usage               = local.eks_master_kms_key_usage
  policy_document         = module.eks_master_kms_key_policy_document.json
  deletion_window_in_days = var.eks_master_kms_key_deletion_window_in_days
  common_tags             = var.common_tags
  kms_key_tags            = var.kms_key_tags
  kms_key_resource_prefix = var.kms_key_resource_prefix
  environment_name        = var.environment_name
  kms_key_tier_name       = var.eks_master_tier_name
}

module "eks_master_security_group" {
  source = "../../../modules/aws/compute/security_group"

  security_group_resource_prefix = var.security_group_resource_prefix
  environment_name               = var.environment_name
  security_group_tier_name       = var.eks_master_tier_name
  vpc_id                         = data.aws_vpc.current.id
  security_group_ingress_rules   = local.eks_master_security_group_ingress_rules
  security_group_egress_rules    = local.eks_master_security_group_egress_rules
  common_tags                    = var.common_tags
  security_group_tags            = var.security_group_tags
}

module "eks_master_instances" {
  source = "../../../modules/aws/compute/eks/cluster"

  eks_cluster_resource_prefix = var.eks_cluster_resource_prefix
  environment_name            = var.environment_name
  eks_cluster_tier_name       = var.eks_master_tier_name
  # id = module.eks_cluster_
  role_arn                      = module.eks_master_iam_role.arn
  security_group_ids            = list(module.eks_master_security_group.id)
  eks_cluster_subnet_ids        = data.aws_subnet_ids.private.ids
  eks_cluster_enabled_log_types = var.eks_cluster_enabled_log_types
  eks_cluster_version           = var.eks_cluster_version
  common_tags                   = var.common_tags
  eks_cluster_tags              = var.eks_cluster_tags
}

module "eks_worker_iam_assume_role_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.eks_worker_iam_assume_role_policy_document_statements
}

module "eks_worker_iam_role" {
  source = "../../../modules/aws/identity/iam/role"

  iam_role_resource_prefix         = var.iam_role_resource_prefix
  environment_name                 = var.environment_name
  iam_role_tier_name               = var.eks_worker_tier_name
  assume_role_policy_document_json = module.eks_worker_iam_assume_role_policy_document.json
  path                             = var.eks_worker_iam_role_path
  max_session_duration             = var.eks_worker_iam_role_max_session_duration
  permissions_boundary             = var.eks_worker_iam_role_permissions_boundary
  common_tags                      = var.common_tags
  iam_role_tags                    = var.eks_worker_iam_role_tags
  aws_iam_role_policy_attachments  = local.eks_worker_iam_role_policy_attachments
}

module "eks_worker_kms_key_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.eks_worker_kms_key_policy_document_statements
}

module "eks_worker_kms_key" {
  source = "../../../modules/aws/identity/kms"

  description             = local.eks_worker_kms_key_description
  key_usage               = local.eks_worker_kms_key_usage
  policy_document         = module.eks_worker_kms_key_policy_document.json
  deletion_window_in_days = var.eks_worker_kms_key_deletion_window_in_days
  common_tags             = var.common_tags
  kms_key_tags            = var.kms_key_tags
  kms_key_resource_prefix = var.kms_key_resource_prefix
  environment_name        = var.environment_name
  kms_key_tier_name       = var.eks_worker_tier_name
}

module "eks_worker_security_group" {
  source = "../../../modules/aws/compute/security_group"

  security_group_resource_prefix = var.security_group_resource_prefix
  environment_name               = var.environment_name
  security_group_tier_name       = var.eks_worker_tier_name
  vpc_id                         = data.aws_vpc.current.id
  security_group_ingress_rules   = local.eks_worker_security_group_ingress_rules
  security_group_egress_rules    = local.eks_worker_security_group_egress_rules
  common_tags                    = var.common_tags
  security_group_tags            = var.security_group_tags
}


module "eks_master_node_group" {
  source = "../../../modules/aws/compute/eks/node_group"

  depends_on = [module.eks_master_instances]

  eks_cluster_resource_prefix    = var.eks_cluster_resource_prefix
  environment_name               = var.environment_name
  eks_cluster_tier_name          = var.eks_master_tier_name
  eks_node_group_tier_name       = var.eks_worker_tier_name
  eks_node_group_resource_prefix = var.eks_node_group_resource_prefix
  node_role_arn                  = module.eks_worker_iam_role.arn
  scaling_config_desired_size    = var.eks_worker_desired_capacity
  scaling_config_max_size        = var.eks_worker_max_size
  scaling_config_min_size        = var.eks_worker_min_size
  subnet_ids                     = data.aws_subnet_ids.private.ids
  common_tags                    = var.common_tags
  eks_node_group_tags            = var.eks_node_group_tags
}
