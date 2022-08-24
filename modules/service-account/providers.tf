terraform {
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.28.0"
    }
  }
  required_version = "1.2.7"
}
