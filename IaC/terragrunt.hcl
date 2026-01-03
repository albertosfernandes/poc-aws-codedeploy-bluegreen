remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-states-prod"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

locals {
  environment = "prod"
  region      = "us-east-1"
  project     = "poc-codedeploy-bluegreen"
  common_tags = {
    CostCenter = "1234"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
}
EOF
}