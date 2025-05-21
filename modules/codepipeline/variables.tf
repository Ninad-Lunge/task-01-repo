variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket used for storing pipeline artifacts"
  type        = string
}

variable "github_owner" {
  description = "GitHub repository owner"
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

variable "codebuild_project" {
  description = "CodeBuild project name"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "IAM Role ARN for CodePipeline"
  type        = string
}