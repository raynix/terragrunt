resource "google_service_account" "service_account" {
  count        = var.use_existing_google_service_account ? 0 : 1
  project      = var.project_id
  account_id   = var.account_id
  display_name = var.display_name
}
