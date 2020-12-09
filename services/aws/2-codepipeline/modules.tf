
module "pipeline_iam_role_assume_role_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.pipeline_iam_assume_role_policy_document_statements
}

module "pipeline_iam_role" {
  source = "../../../modules/aws/identity/iam/role"

  iam_role_resource_prefix         = var.pipeline_resource_prefix
  environment_name                 = var.environment_name
  iam_role_tier_name               = var.pipeline_tier_name
  assume_role_policy_document_json = module.pipeline_iam_role_assume_role_policy_document.json
  path                             = var.pipeline_iam_role_path
  max_session_duration             = var.pipeline_iam_role_max_session_duration
  permissions_boundary             = var.pipeline_iam_role_permissions_boundary
  common_tags                      = var.common_tags
  iam_role_tags                    = var.pipeline_iam_role_tags
  aws_iam_role_policy_attachments  = local.pipeline_iam_role_policy_attachments
}

module "pipelinebuild_iam_role_assume_role_policy_document" {
  source = "../../../modules/aws/identity/iam/policy_document"

  statements = local.pipelinebuild_iam_assume_role_policy_document_statements
}

module "pipelinebuild_iam_role" {
  source = "../../../modules/aws/identity/iam/role"

  iam_role_resource_prefix         = var.pipelinebuild_resource_prefix
  environment_name                 = var.environment_name
  iam_role_tier_name               = var.pipelinebuild_tier_name
  assume_role_policy_document_json = module.pipelinebuild_iam_role_assume_role_policy_document.json
  path                             = var.pipelinebuild_iam_role_path
  max_session_duration             = var.pipelinebuild_iam_role_max_session_duration
  permissions_boundary             = var.pipelinebuild_iam_role_permissions_boundary
  common_tags                      = var.common_tags
  iam_role_tags                    = var.pipelinebuild_iam_role_tags
  aws_iam_role_policy_attachments  = local.pipelinebuild_iam_role_policy_attachments
}

module "pipeline_build_terraform" {
  source = "../../../modules/aws/codepipeline/no_approval"

  pipeline_resource_prefix     = var.pipeline_resource_prefix
  environment_name             = var.environment_name
  pipeline_tier_name           = var.pipeline_tier_name
  approval                     = var.approval
  pipeline_role_arn            = module.pipeline_iam_role.arn
  pipelinebuild_role_arn       = module.pipelinebuild_iam_role.arn
  template_file_buildspec      = ""
  pipeline_s3_bucket           = var.pipeline_s3_bucket
  github_repo_owner            = var.github_repo_owner
  github_repo                  = var.github_repo
  github_repo_branch           = var.github_repo_branch
  github_repo_oauth_token      = textdecodebase64(var.github_repo_oauth_token, "UTF-8")
  pipelinebuild_build_template = var.pipelinebuild_build_template
  common_tags                  = var.common_tags
  pipeline_tags                = var.pipeline_tags

}
