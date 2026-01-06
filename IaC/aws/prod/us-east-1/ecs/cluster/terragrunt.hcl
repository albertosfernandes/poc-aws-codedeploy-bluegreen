terraform {
  source = "git::https://github.com/albertosfernandes/terraform-modules.git//aws/resources/ecs/cluster?ref=v1.0.2"
}

include {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  environment  = include.locals.environment
  application  = "poc-codedeploy-bluegreen"

  cluster_name = "poc-codedeploy-bluegreen-prod"

  enable_fargate_spot = true

  tags_extra = include.locals.common_tags
}
