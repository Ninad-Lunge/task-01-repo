variable "github_oauth_token" {
  description = "GitHub OAuth Token"
  type        = string
  sensitive   = true
}

variable "github_token_secret_arn" {
  description = "ARN of GitHub OAuth token stored in Secrets Manager"
  type        = string
  default     = ""  # optional fallback
}