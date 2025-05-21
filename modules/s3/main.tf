resource "aws_s3_bucket" "scan_reports" {
  bucket = var.bucket_name
  force_destroy = true
}

output "bucket_id" {
  value = aws_s3_bucket.scan_reports.id
}