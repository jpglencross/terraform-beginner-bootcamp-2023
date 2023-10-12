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

  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}