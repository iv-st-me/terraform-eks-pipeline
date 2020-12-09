locals {

  pipeline_name = format(
    "%s-%s-%s-%s",
    lower(var.pipeline_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.pipeline_tier_name),
  )

}
