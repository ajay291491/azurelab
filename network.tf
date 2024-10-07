# Create a virtual network within the resource group
resource "azurerm_virtual_network" "az-700-vnet" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.az-700-rg.name
  location            = azurerm_resource_group.az-700-rg.location
  address_space       = ["10.0.0.0/16"]
}