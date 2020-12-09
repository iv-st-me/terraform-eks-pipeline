resource "aws_iam_policy" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.iam_policy_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.iam_policy_tier_name),
  )

  description = var.description
  path        = var.path
  policy      = var.policy
}
