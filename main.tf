provider "aws" {
  region = var.aws_region
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.scan_report_bucket
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = var.ecr_repo_name
}

module "iam" {
  source = "./modules/iam"
  codebuild_role_name = module.iam.codebuild_role_name
}

module "secrets" {
  source = "./modules/secrets"
  github_oauth_token = var.github_oauth_token
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  pipeline_name         = "ecr-vulnerability-pipeline"
  github_owner          = var.github_owner
  github_repo           = var.github_repo
  github_oauth_token    = var.github_oauth_token
  codebuild_project     = module.codebuild.project_name
  artifact_bucket       = module.s3.bucket_name
  codepipeline_role_arn = module.iam.codebuild_role_arn
}

module "codebuild" {
  source              = "./modules/codebuild"
  project_name        = "ecr-vulnerability-scan"
  github_repo_url     = var.github_repo_url
  ecr_repo_name       = var.ecr_repo_name
  region              = var.aws_region
  scan_report_bucket  = var.scan_report_bucket
  codebuild_role_arn  = module.iam.codebuild_role_arn
  github_token_secret_arn = aws_secretsmanager_secret.github_token.arn
  github_oauth_token = var.github_oauth_token
}