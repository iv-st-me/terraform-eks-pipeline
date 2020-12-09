variable "pipeline_resource_prefix" {
  type        = string
  description = "Prefix name for the Pipeline"
}

variable "environment_name" {
  type        = string
  description = "Name of the environment"
}

variable "pipeline_tier_name" {
  type        = string
  description = "Tier name for the Pipeline"
}

variable "approval" {
  type        = string
  description = "Create Pipeline with Approval?"
}

variable "pipeline_role_arn" {
  type        = string
  description = "ARN for the Pipeline IAM role"
}

variable "pipelinebuild_role_arn" {
  type        = string
  description = "ARN for the Pipelinebuild IAM role"
}

variable "template_file_buildspec" {
  type        = string
  description = "YAML Buildspec file containing the Pipeline build"
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
  description = "String of YAML buildspec file containing the Pipeline build. Note that indenation must be preserved due to YAML sytax and new line is \n"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to resources"
}

variable "pipeline_tags" {
  type        = map(string)
  description = "Map of tags to assign to EKS Cluster"
}
