resource "azurerm_resource_group" "terraformrgsub" {
  name     = "terraform_rgsub"
  location = var.location
}

resource "azurerm_virtual_network" "terraformvnetsub" {
  name                = "terraform_vnetsub"
  location            = var.location
  resource_group_name = "terraform_rgsub"
  address_space       = var.terraform_vnetsub
  depends_on = [
    azurerm_resource_group.terraformrgsub

  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.terraformrgsub.name
  virtual_network_name = azurerm_virtual_network.terraformvnetsub.name
  address_prefixes     = [cidrsubnet(var.terraform_vnetsub[0], 8, count.index)]
  depends_on = [
    azurerm_virtual_network.terraformvnetsub
  ]

}


