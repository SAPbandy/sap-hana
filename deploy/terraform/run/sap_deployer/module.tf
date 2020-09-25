/*
Description:

  Example to deploy deployer(s) using local backend.
*/
module "sap_deployer" {
  source         = "../../terraform-units/modules/sap_deployer/"
  infrastructure = var.infrastructure
  deployers      = var.deployers
  options        = var.options
  ssh-timeout    = var.ssh-timeout
  sshkey         = var.sshkey
  naming         = module.sap_namegenerator.naming
}

module "sap_namegenerator" {
  source               = "../../terraform-units/modules/sap_namegenerator"
  environment          = local.environment
  location             = local.location
  codename             = local.codename
  management_vnet_name = local.vnet_mgmt_name_part
  random-id            = random_id.deploy-random-id.hex
  //These are not needed for the deployer
  sap_vnet_name = try(var.infrastructure.vnets.sap.name, "")
  sap_sid       = ""
  db_sid        = ""

}

