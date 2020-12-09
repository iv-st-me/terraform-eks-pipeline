variable "security_group_resource_prefix" {
  type        = string
  description = "Prefix name for Security Group"
}

variable "environment_name" {
  type        = string
  description = "Name of the environment"
}

variable "security_group_tier_name" {
  type        = string
  description = "Tier name for Security Group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where to create the Security Group"
}

variable "security_group_ingress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of ingress rules to set on the SG"
}

variable "security_group_egress_rules" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string), security_groups = list(string), self = bool, description = string }))
  description = "List of maps of egress rules to set on the SG"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to all resources."
}

variable "security_group_tags" {
  type        = map(string)
  description = "Map of tags to assign to SG"
}
