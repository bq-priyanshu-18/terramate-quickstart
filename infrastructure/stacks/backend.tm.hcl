# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {

      # the default values of globals are defined in config.tm.hcl in this directory
      backend "local" {
        path = global.local_tfstate_path
      }
    }
  }
}