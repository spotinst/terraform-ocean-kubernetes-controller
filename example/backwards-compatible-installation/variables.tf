variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
  default     = "token-12345678"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
  default     = "act-123456"
}

variable "cluster_identifier" {
  type        = string
  description = "Cluster identifier"
  default     = "identifier"
}

