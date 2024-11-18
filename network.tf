# Create a virtual network within the resource group
resource "azurerm_virtual_network" "az-700-vnet" {
  name                = "az-700-study-network"
  resource_group_name = azurerm_resource_group.az-700-rg.name
  location            = azurerm_resource_group.az-700-rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "az-700-subnet" {
  name                 = "az-700-subnet"
  resource_group_name  = azurerm_resource_group.az-700-rg.name
  virtual_network_name = azurerm_virtual_network.az-700-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "az-700-vm-nic" {
  name                = "az-700-vm-nic"
  location            = azurerm_resource_group.az-700-rg.location
  resource_group_name = azurerm_resource_group.az-700-rg.name

  ip_configuration {
    name                          = "az-700-subnet"
    subnet_id                     = azurerm_subnet.az-700-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
