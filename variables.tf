variable "gcp_credentials_file" {
  type        = "string"
  description = "credential file path of GCP proejct service account"
}

variable "gcp_project" {
  type        = "string"
  description = "gcp project id"
}

variable "allow_ips" {
  type        = "list"
  description = "CIDR"
}
