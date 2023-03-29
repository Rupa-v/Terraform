resource "azurerm_resource_group" "terraformresource" {
  name     = "terraform_resource"
  location = var.location
}

resource "azurerm_virtual_network" "terraformvnetsub" {
  name                = "terraform_vnetsub"
  location            = var.location
  resource_group_name = "terraform_resource"
  address_space       = var.ntier_vnet_info.terraform_vnetsub
  depends_on = [
    azurerm_resource_group.terraformresource

  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.ntier_vnet_info.subnet_names)
  name                 = var.ntier_vnet_info.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.terraformresource.name
  virtual_network_name = azurerm_virtual_network.terraformvnetsub.name
  address_prefixes     = [cidrsubnet(var.ntier_vnet_info.terraform_vnetsub[0], 8, count.index)]
  depends_on = [
    azurerm_virtual_network.terraformvnetsub
  ]

}


