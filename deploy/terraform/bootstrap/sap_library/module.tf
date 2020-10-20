/*
  Description:
  Setup sap library
*/
module "sap_library" {
  source                  = "../../terraform-units/modules/sap_library"
  infrastructure          = var.infrastructure
  storage_account_sapbits = var.storage_account_sapbits
  storage_account_tfstate = var.storage_account_tfstate
  naming                  = module.sap_namegenerator.naming
  software                = var.software
  deployer                = var.deployer
  spn                     = local.spn
  deployer_tfstate        = data.terraform_remote_state.deployer

}

module "sap_namegenerator" {
  source      = "../../terraform-units/modules/sap_namegenerator"
  environment = lower(try(var.infrastructure.environment, ""))
  location    = try(var.infrastructure.region, "")
  random_id   = module.sap_library.random_id
}
