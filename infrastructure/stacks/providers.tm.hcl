generate_hcl "_terramate_generated_providers.tf" {
  content {
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
      region = us-east-2
    }  
  }
}

