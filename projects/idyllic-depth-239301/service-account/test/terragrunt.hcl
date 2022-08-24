locals {
  proj = regex("terragrunt/projects/([^/]+)", get_terragrunt_dir())[0]
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id = local.proj
  account_id   = "test-sa"
  display_name = "Service Account for testing"
}
