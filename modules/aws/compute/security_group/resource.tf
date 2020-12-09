
# Security Group
resource "aws_security_group" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.security_group_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.security_group_tier_name),
  )

  description = local.security_group_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null)
      security_groups = lookup(ingress.value, "security_groups", null)
      self            = lookup(ingress.value, "self", null)
      description     = lookup(ingress.value, "description", null)
    }
  }

  dynamic "egress" {
    for_each = var.security_group_egress_rules
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null)
      security_groups = lookup(egress.value, "security_groups", null)
      self            = lookup(egress.value, "self", null)
      description     = lookup(egress.value, "description", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.security_group_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.security_group_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.security_group_tier_name),
      )
    },
  )
}
