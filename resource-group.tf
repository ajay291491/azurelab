# Create a resource group
resource "azurerm_resource_group" "az-700-rg" {
  name     = "az-700-resource-group"
  location = "West Europe"
}