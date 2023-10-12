terraform {
  # Migrate state to tf cloud: https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
  cloud {
    organization = "tf_bootcamp"

    workspaces {
      name = "terra-house-van"
    }
  }

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