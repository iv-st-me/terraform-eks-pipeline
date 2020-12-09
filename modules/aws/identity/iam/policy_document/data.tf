data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = var.statements
    content {
      sid       = statement.value.sid != "" ? statement.value.sid : null
      effect    = statement.value.effect != "" ? statement.value.effect : null
      actions   = statement.value.actions != "" ? statement.value.actions : null
      resources = statement.value.resources != "" ? statement.value.resources : null

      dynamic "condition" {
        for_each = lookup(statement.value.condition[0], "test") != "" ? statement.value.condition : []
        content {
          test     = condition.value.test != "" ? condition.value.test : null
          variable = condition.value.variable != "" ? condition.value.variable : null
          values   = length(condition.value.values) > 0 ? condition.value.values : null
        }
      }

      dynamic "principals" {
        for_each = lookup(statement.value.principals[0], "type") != "" ? statement.value.principals : []
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }
    }
  }
}
