locals {
  terraform_assume_role_name = "Administrator"

  pipeline_iam_role_policy_description = format(
    "%s %s %s %s",
    lower(var.pipeline_resource_prefix),
    lower(var.environment_name),
    lower(var.pipeline_tier_name),
    "IAM role policy"
  )

  pipelinebuild_iam_role_policy_description = format(
    "%s %s %s %s",
    lower(var.pipelinebuild_resource_prefix),
    lower(var.environment_name),
    lower(var.pipelinebuild_tier_name),
    "IAM role policy"
  )

  pipeline_iam_assume_role_policy_document_statements = [
    {
      sid       = "0"
      effect    = "Allow"
      actions   = ["sts:AssumeRole"]
      resources = []
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type        = "Service"
          identifiers = ["codepipeline.amazonaws.com"]
        }
      ]
    }
  ]

  pipeline_iam_role_policy_attachments = list(
    data.aws_iam_policy.pipeline_policy.arn,
  )

  pipelinebuild_iam_assume_role_policy_document_statements = [
    {
      sid       = "0"
      effect    = "Allow"
      actions   = ["sts:AssumeRole"]
      resources = []
      condition = [
        {
          test     = ""
          variable = ""
          values   = []
        }
      ]
      principals = [
        {
          type = "Service"
          identifiers = [
            "codebuild.amazonaws.com",
            "codedeploy.amazonaws.com",
            "codepipeline.amazonaws.com",
            "eks.amazonaws.com"
          ]
        }
      ]
    }
  ]

  pipelinebuild_iam_role_policy_attachments = list(
    data.aws_iam_policy.pipelinebuild_policy.arn,
  )

}
