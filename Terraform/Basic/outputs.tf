output "terrabucket-versioning" {
  value = aws_s3_bucket.terrabucket.versioning
}

output "terraiam-all_details" {
  value = aws_iam_user.terraiam
}


# Separate file for outputs.
