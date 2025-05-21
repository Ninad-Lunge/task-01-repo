variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "scan_report_bucket" {
  description = "S3 bucket name to store scan reports"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository HTTPS URL"
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or user"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}