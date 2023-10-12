output "module_bucket_name" {
  description = "bucket name for static site hosting"
  value = module.terrahouse_aws.bucket_name
}

output "static_site_domain" {
  description = "domain the static site is deployed to"
  value = module.terrahouse_aws.static_site_domain
}



output "cdn_domain_name" {
  description = "domain the static site is deployed to on cloudfront"
  value = module.terrahouse_aws.cdn_domain_name
}