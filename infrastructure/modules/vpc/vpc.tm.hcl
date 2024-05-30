globals {
  app_name = "terramate-${terramate.stack.path.basename}"
  app_location = global.location
  app_image = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  app_invokers = ["allUsers"]
}

generate_hcl "_terramate_generated_cloud_run.tf" {
  content {

    # We are invoking our local wrapper to the module
    # to also demonstrate terramate orchestration capabilities
    module "vpc" {
      source = "${terramate.stack.path.to_root}/modules/vpc"

      project = global.project

      name                 = global.app_name
    #   location             = global.app_location
    #   image                = global.app_image
    #   service_account_name = global.app_service_account_name

    #   iam = [
    #     {
    #       role    = "roles/run.invoker"
    #       members = global.app_invokers
    #     }
    #   ]
    }

    # An output to show the cloud run url after a successful terraform apply
    # output "url" {
    #   description = "URL of ${global.app_name}"
    #   value       = module.cloud_run_app.service.status[0].url
    # }
  }
}