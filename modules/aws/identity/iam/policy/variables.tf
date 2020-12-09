variable "iam_policy_resource_prefix" {
  type        = string
  description = "Prefix name for IAM Policy object"
}

variable "environment_name" {
  type        = string
  description = "Reference name of the environment"
}

variable "iam_policy_tier_name" {
  type        = string
  description = "Tier name for IAM Policy"
}

variable "description" {
  type        = string
  description = "Description for the IAM policy"
}

variable "path" {
  type        = string
  description = "Path where to create the policy"
}

variable "policy" {
  type        = string
  description = "Policy document in JSON formatted string"
}
