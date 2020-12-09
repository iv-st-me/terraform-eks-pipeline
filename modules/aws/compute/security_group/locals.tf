locals {
  security_group_description = format(
    "%s %s",
    lower(var.security_group_tier_name),
    "security group."
  )
}
