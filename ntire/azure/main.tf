resource "azurerm_resource_group" "terraformrg25" {
  name     = "terraform_rg25"
  location = var.location
}

resource "azurerm_virtual_network" "terraformvnet1225" {
  name                = "terraform_vnet1225"
  location            = var.location
  resource_group_name = "terraform_rg25"
  address_space       = var.terraform_vnet1225
  depends_on = [
    azurerm_resource_group.terraformrg25

  ]
}


