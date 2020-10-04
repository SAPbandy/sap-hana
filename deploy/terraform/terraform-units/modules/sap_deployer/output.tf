/*
Description:

  Output from sap_deployer module.
*/

// Deployer resource group name
output "deployer_rg_name" {
  value = azurerm_resource_group.deployer[0].name
}

// Details of management vnet that is deployed/imported
output "vnet_mgmt" {
  value = local.vnet_mgmt_exists ? data.azurerm_virtual_network.vnet_mgmt[0] : azurerm_virtual_network.vnet_mgmt[0]
}

// Details of management subnet that is deployed/imported
output "subnet_mgmt" {
  value = local.sub_mgmt_exists ? data.azurerm_subnet.subnet_mgmt[0] : azurerm_subnet.subnet_mgmt[0]
}

// Details of the management vnet NSG that is deployed/imported
output "nsg_mgmt" {
  value = local.sub_mgmt_nsg_exists ? data.azurerm_network_security_group.nsg_mgmt[0] : azurerm_network_security_group.nsg_mgmt[0]
}

// Details of the user assigned identity for deployer(s)
output "deployer_uai" {
  value = azurerm_user_assigned_identity.deployer
}

// Details of deployer pip(s)
output "deployer_pip" {
  value = azurerm_public_ip.deployer
}

// Details of deployer(s)
output "deployers" {
  value = local.deployers_updated
}

output "random_id" {
  value = random_id.deployer.hex
}
