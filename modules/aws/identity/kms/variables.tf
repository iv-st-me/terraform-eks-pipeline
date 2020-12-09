variable "description" {
  type        = string
  description = "Description of the key"
}

variable "key_usage" {
  type        = string
  description = "Intended usage of the key"
}

variable "policy_document" {
  type        = string
  description = "Policy JSON document"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Days after which the key is deleted after resource deletion: between 7 and 30 days"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to all resources"
}

variable "kms_key_tags" {
  type        = map(string)
  description = "Map of tags to assign to KMS Key"
}

variable "kms_key_resource_prefix" {
  type        = string
  description = "Prefix name for KMS Key object"
}

variable "environment_name" {
  type        = string
  description = "Reference name of the environment"
}

variable "kms_key_tier_name" {
  type        = string
  description = "Tier name for KMS Key object"
}
