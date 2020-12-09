# IAM Role

resource "aws_iam_role" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.iam_role_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.iam_role_tier_name),
  )

  assume_role_policy    = var.assume_role_policy_document_json
  path                  = var.path
  description           = local.description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  force_detach_policies = true

  tags = merge(
    var.common_tags,
    var.iam_role_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.iam_role_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.iam_role_tier_name),
      )
    },
  )
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.aws_iam_role_policy_attachments)

  policy_arn = element(var.aws_iam_role_policy_attachments, count.index)
  role       = aws_iam_role.this.name
}
