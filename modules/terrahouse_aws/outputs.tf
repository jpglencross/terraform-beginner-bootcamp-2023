output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "static_site_domain" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}