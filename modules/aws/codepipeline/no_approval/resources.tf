resource "aws_codepipeline" "this" {
  # count = var.approval ? 0 : 1
  name = local.pipeline_name

  role_arn = var.pipeline_role_arn

  artifact_store {
    location = var.pipeline_s3_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "GetSource"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["SourceOutput"]

      configuration = {
        Owner      = var.github_repo_owner
        Repo       = var.github_repo
        Branch     = var.github_repo_branch
        OAuthToken = var.github_repo_oauth_token
      }
    }
  }

  stage {
    name = "InvokeTerraformBuild"

    action {
      name             = "TerraformBuildAction"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = ["InvokeTerraformBuildOutput"]

      configuration = {
        ProjectName = local.pipeline_name
      }
    }
  }

}

resource "aws_codebuild_project" "this" {
  # depends_on = [aws_codebuild_project.vpcnet]
  name = format(
    "%s-%s-%s-%s",
    lower(var.pipeline_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.pipeline_tier_name),
  )
  description = "${var.environment_name}_codebuild_project"

  build_timeout = "20"
  service_role  = var.pipelinebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/eb-go-1.5-amazonlinux-64:2.1.3"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "CODEPIPELINE"
    buildspec       = var.pipelinebuild_build_template
    git_clone_depth = 0
  }

  tags = merge(
    var.common_tags,
    var.pipeline_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.pipeline_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.pipeline_tier_name),
      )
    },
  )

}
