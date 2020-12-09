
# Organization
account_id = "235297331187"

# Global
common_region       = "eu-central-1"
vpc_resource_prefix = "vpc"
common_tags = {
  Terraform = "true",
  Team      = "myteam"
}

subnet_resource_prefix                     = "net"
private_subnet_tier_name                   = "private"
eks_cluster_resource_prefix                = "eks"
terraform_assume_role_name                 = ""
iam_policy_resource_prefix                 = "eksiampolicy"
environment_name                           = "shared"
eks_master_tier_name                       = ""
eks_master_iam_role_policy_path            = ""
iam_role_resource_prefix                   = "eksiamrole"
eks_master_iam_role_path                   = "/"
eks_master_iam_role_max_session_duration   = 7200 # seconds
eks_master_iam_role_permissions_boundary   = ""
eks_master_iam_role_tags                   = {}
eks_master_kms_key_deletion_window_in_days = 7
kms_key_tags                               = {}
kms_key_resource_prefix                    = "ekskms"
security_group_resource_prefix             = "ekssg"
security_group_tags                        = {}
# eks_master_security_group_custom_ingress_rules = [
#   {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#     security_groups = [""]
#     self            = true
#     description     = "EKS custom ingress rule"
#   },
# ]
eks_master_security_group_custom_ingress_rules = []

# eks_master_security_group_custom_egress_rules = [
#   {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#     security_groups = [""]
#     self            = true
#     description     = "EKS custom egress rule"
#   },
# ]
eks_master_security_group_custom_egress_rules = []

eks_node_group_resource_prefix                 = "eksnode2"
eks_cluster_enabled_log_types                  = []
eks_cluster_version                            = "1.18" #1.18, 1.17, 1.16, 1.15, 1.14
eks_cluster_tags                               = {}
eks_worker_desired_capacity                    = 3
eks_worker_max_size                            = 5
eks_worker_min_size                            = 2
eks_node_group_tags                            = {}
eks_worker_tier_name                           = "private"
eks_worker_iam_role_policy_path                = "/"
eks_worker_iam_role_path                       = "/"
eks_worker_iam_role_max_session_duration       = 7200
eks_worker_iam_role_permissions_boundary       = ""
eks_worker_iam_role_tags                       = {}
eks_worker_kms_key_deletion_window_in_days     = 7
eks_worker_security_group_custom_ingress_rules = []
eks_worker_security_group_custom_egress_rules  = []
