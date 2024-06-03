globals {
  app_name = "terramate-${terramate.stack.path.basename}"
  app_location = global.location
  app_image = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  app_invokers = ["allUsers"]
}

generate_hcl "_vpc_module.tf" {
  content {
    # We are invoking our local wrapper to the module
    # to also demonstrate terramate orchestration capabilities
    module "vpc" {
      source  = "${terramate.stack.path.to_root}/modules/vpc"
      internet_gateway_name = global.vpc.internet_gateway_name
      vpc_cidr = global.vpc.vpc_cidr
      vpc_name = global.vpc.vpc_name
      public_subnets =  global.vpc.public_subnets
      private_subnets =  global.vpc.private_subnets
      nat_gateway_name = global.vpc.nat_gateway_name
      private_route_table_name = global.vpc.private_route_table_name
      public_route_table_name = global.vpc.public_route_table_name
    }
  }
}