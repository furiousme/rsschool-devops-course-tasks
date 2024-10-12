variable "account_id" {
  type      = string
  sensitive = true
}

variable "gh_username" {
  type = string
}

variable "user_profile_name" {
  type      = string
  sensitive = true
}

variable "pipeline" {
  type = bool
}