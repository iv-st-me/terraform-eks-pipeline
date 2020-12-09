
# KMS Key

resource "aws_kms_key" "this" {
  is_enabled              = local.is_enabled
  key_usage               = local.key_usage
  enable_key_rotation     = local.enable_key_rotation
  description             = var.description
  policy                  = var.policy_document
  deletion_window_in_days = var.deletion_window_in_days

  tags = merge(
    var.common_tags,
    var.kms_key_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.kms_key_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.kms_key_tier_name),
      )
    },
  )
}

resource "aws_kms_alias" "this" {
  name = format(
    "%s%s-%s-%s-%s",
    "alias/",
    lower(var.kms_key_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.kms_key_tier_name)
  )

  target_key_id = aws_kms_key.this.key_id
}
