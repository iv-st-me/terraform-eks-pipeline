locals {
  description = join(" ",
    list(
      join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
      lower(var.environment_name),
      lower(var.iam_role_tier_name),
      "role.",
    )
  )
}
