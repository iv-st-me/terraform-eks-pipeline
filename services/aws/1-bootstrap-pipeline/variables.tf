variable "common_region" {
  type        = string
  description = "The Region where to create resources"
}

variable "account_id" {
  type        = string
  description = "Account ID for the account"
}

variable "environment_name" {
  type        = string
  description = "Name of the environment"
}

variable "pipeline_tier_name" {
  type        = string
  description = "Tier name for the Pipeline"
}

variable "iam_policy_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Policy object"
}

variable "pipeline_iam_role_policy_path" {
  type        = string
  description = "Path in which to create the policy for Pipeline"
}

variable "pipeline_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Role"
}

variable "pipeline_iam_role_path" {
  type        = string
  description = "Path of Pipeline nodes IAM Role"
}

variable "pipeline_iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds to set for specified IAM role. Vvalue from 1 hour to 12 hours. Default is 1 hour"
}

variable "pipeline_iam_role_permissions_boundary" {
  type        = string
  description = "ARN of policy that is used to set permissions boundary for IAM role"
}

variable "pipelinebuild_tier_name" {
  type        = string
  description = "Tier name for Pipeline object"
}

variable "pipelinebuild_iam_role_policy_path" {
  type        = string
  description = "Path in which to create the policy for Pipelinebuild"
}

variable "pipelinebuild_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Role"
}

variable "pipelinebuild_iam_role_path" {
  type        = string
  description = "Path of Pipelinebuild nodes IAM Role"
}

variable "pipelinebuild_iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds to set for specified IAM role. Vvalue from 1 hour to 12 hours. Default is 1 hour"
}

variable "pipelinebuild_iam_role_permissions_boundary" {
  type        = string
  description = "ARN of policy that is used to set permissions boundary for IAM role"
}

variable "pipeline_iam_role_tags" {
  type        = map(string)
  description = "Map of tags to assign to Pipelinebuild IAM Role"
}

variable "pipelinebuild_iam_role_tags" {
  type        = map(string)
  description = "Map of tags to assign to Pipelinebuild IAM Role"
}

variable "approval" {
  type        = string
  description = "Create Pipeline with Approval?"
}

variable "pipeline_s3_bucket" {
  type        = string
  description = "S3 bucket for pipeline"
}

variable "github_repo_owner" {
  type        = string
  description = "Github repository owner"
}

variable "github_repo" {
  type        = string
  description = "Github repository name"
}

variable "github_repo_branch" {
  type        = string
  description = "Github repository branch"
}

variable "github_repo_oauth_token" {
  type        = string
  description = "Github repository OAuth tocken"
}

variable "pipelinebuild_build_template" {
  type        = string
  description = "Buildtemplate"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to resources"
}

variable "pipeline_tags" {
  type        = map(string)
  description = "Map of tags to assign to Pipeline"
}
