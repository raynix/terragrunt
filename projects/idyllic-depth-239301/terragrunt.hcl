locals {
  proj = regex("terragrunt/projects/([^/]+)", get_terragrunt_dir())[0]
}

remote_state {
  backend = "gcs"
  config = {
    bucket = "${local.proj}-terragrunt-states"
    prefix = "terragrunt/${path_relative_to_include()}"
  }
}

terraform {
  source = "${path_relative_from_include()}/../..//modules/${path_relative_to_include()}/../"

  extra_arguments "automation" {
    commands = [
      "apply",
      "destroy",
      "import",
      "plan",
    ]

    env_vars = {
      TF_IN_AUTOMATION = "1"
      TF_INPUT         = "0"
    }
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "google" {
  project = "${local.proj}"
  region = "australia-southeast1"
}
EOF
}
