module "organization" {
  source                        = "../../../modules/aws/organizations/organization"
  aws_service_access_principals = local.organization_aws_service_access_principals
  enabled_policy_types          = local.organization_enabled_policy_types
  feature_set                   = local.organization_feature_set
}
