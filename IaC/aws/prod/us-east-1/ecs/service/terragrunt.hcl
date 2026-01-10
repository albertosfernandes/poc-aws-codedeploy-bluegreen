terraform {
  source = "git::https://github.com/albertosfernandes/terraform-modules.git//aws/resources/ecs/service?ref=v1.1.3"
}

include {
  path   = find_in_parent_folders()
  expose = true
}

dependency "cluster" {
  config_path = "../cluster"
}

inputs = {
  environment = include.locals.environment
  application = "fast-api"

  service_name = "fast-api-prod"

  cluster_arn = dependency.cluster.outputs.cluster_arn

  # NÃO define task_definition_arn
  # Pipeline será o dono

  desired_count = 1

  subnets         = ["subnet-0947a0b6faf75a77e", "subnet-0396c630f82c418ba"]
  security_groups = ["sg-0f240751059bafd77"]

  assign_public_ip = true

  tags_extra = include.locals.common_tags
}
