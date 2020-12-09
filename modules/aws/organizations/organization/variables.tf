variable "aws_service_access_principals" {
  description = "List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com. Organization must have feature_set set to ALL."
  type        = list
}

variable "enabled_policy_types" {
  description = "List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to ALL."
  type        = list
}


variable "feature_set" {
  description = "Specify 'ALL' (default) or 'CONSOLIDATED_BILLING'."
  type        = string
}
