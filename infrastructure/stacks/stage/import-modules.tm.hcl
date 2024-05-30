generate_hcl "inport_modules.tf" {
  content{
    import {
      source = "/modules/vpc/vpc.tm.hcl"
    }
  }
}