// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.20.1"
    }
  }
}
provider "aws" {
  allowed_account_ids = [
    "63421378578223",
  ]
  region = us-east-2
  shared_config_files = [
    var.tfc_aws_dynamic_credentials.default.shared_config_file,
  ]
}
