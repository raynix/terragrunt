variable "project_id" {
  type        = string
  description = "The project id."
}

variable "account_id" {
  type        = string
  description = "The account id used to generate the service account email address."
}

variable "display_name" {
  type        = string
  description = "The display name for the service account."
  default     = ""
}

variable "use_existing_google_service_account" {
  type        = bool
  description = "Use an existing google service account"
  default     = false
}
