# Bucket naming rules here: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
resource "random_string" "bucket_name" {
  length  = 32
  lower   = true
  upper   = false
  special = false
}

# Random provider docs: https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  tags = {
    UserUuid        = var.user_uuid
    Environment = "Dev"
  }
}