data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy" "pipeline_policy" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "pipelinebuild_policy" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
