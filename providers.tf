terraform {
  # Migrate state to tf cloud: https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
  cloud {
    organization = "tf_bootcamp"

    workspaces {
      name = "terra-house-van"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
}