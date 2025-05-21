resource "aws_ecr_repository" "repo" {
  name = var.repo_name

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.repo.repository_url
}