terraform {
  # Migrate state to tf cloud: https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
  cloud {
    organization = "tf_bootcamp"

    workspaces {
      name = "terra-house-van"
    }
  }

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"

  user_uuid   = var.user_uuid
  bucket_name = var.bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
  assets_path = var.assets_path
}