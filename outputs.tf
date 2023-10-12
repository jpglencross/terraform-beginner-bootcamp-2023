output "module_bucket_name" {
  description = "bucket name for static site hosting"
  value = module.terrahouse_aws.bucket_name
}