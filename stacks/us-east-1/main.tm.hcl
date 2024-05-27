generate_hcl "_data.tf" {
  content {
  }
}

generate_hcl "_locals.tf" {
  content {
  }
}

generate_hcl "_main.tf" {
  content {
    terraform {
      required_version = ">= 1.5"
      # cloud {
      #   organization = "veve-official"

      #   workspaces {
      #       name = "lambda-veve-development-us-east-1"
      #   }
      # }
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
      region = us-east-2
      allowed_account_ids = ["63421378578223"]
      shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]
    }
    provider "vault" {
        skip_child_token = true
        address          = var.tfc_vault_dynamic_credentials.default.address

        auth_login_token_file {
            filename = var.tfc_vault_dynamic_credentials.default.token_filename
        }
    }    
  }
}


generate_hcl "_outputs.tf" {
  content {
  }
}

generate_hcl "_variables.tf" {
  content {
  }
}


generate_hcl "_test.tf" {
  content {
  }
}