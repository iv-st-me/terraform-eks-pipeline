variable "iam_role_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Role"
}

variable "environment_name" {
  type        = string
  description = "Name of the environment"
}

variable "iam_role_tier_name" {
  type        = string
  description = "Tier name for IAM Role"
}

variable "assume_role_policy_document_json" {
  type        = string
  description = "Assume role policy JSON document"
}

variable "path" {
  type        = string
  description = "Path to the Role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration (in seconds) to set for the Role. Value from 1 hour to 12 hours. Default is 1 hour"
}

variable "permissions_boundary" {
  type        = string
  description = "ARN of the policy that is used to set the permissions boundary for the role"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to all resources"
}

variable "iam_role_tags" {
  type        = map(string)
  description = "Map of tags to assign to IAM Role"
}

variable "aws_iam_role_policy_attachments" {
  type        = list(string)
  description = "List of ARN policies to attach to the role"
}
