# Variabel untuk konfigurasi provider Google Cloud
variable "gcp_project_id" {
  description = "Project ID GCP"
  type        = string
  default     = "notional-portal-478106-m4"
}

variable "gcp_region" {
  description = "Region default (Jakarta)"
  type        = string
  default     = "asia-southeast2"
}

variable "gcp_zone" {
  description = "Zone default (Jakarta Zone A)"
  type        = string
  default     = "asia-southeast2-a"
}

variable "git_repo_url" {
  description = "URL repositori Git publik untuk di-clone"
  type        = string
}

variable "mysql_database" {
  description = "Nama database WordPress"
  type        = string
  sensitive   = true
}

variable "mysql_user" {
  description = "User untuk database WordPress"
  type        = string
  sensitive   = true
}

variable "mysql_password" {
  description = "Password untuk user database"
  type        = string
  sensitive   = true
}

variable "mysql_root_password" {
  description = "Password root untuk database MySQL"
  type        = string
  sensitive   = true
}