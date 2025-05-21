variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "scan_report_bucket" {
  description = "S3 bucket name to store scan reports"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "codebuild_role_arn" {
  description = "IAM Role ARN for CodeBuild"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub OAuth Token"
  type        = string
  sensitive   = true
}

variable "github_token_secret_arn" {
  description = "ARN of GitHub OAuth token stored in Secrets Manager"
  type        = string
}
