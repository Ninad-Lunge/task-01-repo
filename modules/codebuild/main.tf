resource "aws_codebuild_project" "build" {
  name         = var.project_name
  service_role = var.codebuild_role_arn

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:6.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "ECR_REPO_NAME"
      value = var.ecr_repo_name
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }

    environment_variable {
      name  = "REGION"
      value = var.region
    }

    environment_variable {
      name  = "REPORT_BUCKET"
      value = var.scan_report_bucket
    }
  }

  source {
    type      = "GITHUB"
    location  = var.github_repo_url
    buildspec = file("${path.module}/buildspec.yml")
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}