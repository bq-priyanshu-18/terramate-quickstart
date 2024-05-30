
globals {
  ### TERRAFORM ###############################################################

  # all variables defined here can be overwritten in any sub-directory and on the
  # stack level

  # The global terraform version to use
  terraform_version = "~> 1.6"

  # provider settings and defaults
  terraform_google_provider_version = "~> 4.0"
  terraform_google_provider_region  = "europe-north1"

  terraform_google_provider_project = "wianalytics-vo"

  local_tfstate_path = "terraform.tfstate"

  ### GLOBALS ##################################################################

  project  = global.terraform_google_provider_project
  location = global.terraform_google_provider_region
}