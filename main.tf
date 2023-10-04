terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

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
    Name        = random_string.bucket_name.result
    Environment = "Dev"
  }
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
