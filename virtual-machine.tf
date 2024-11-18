resource "azurerm_linux_virtual_machine" "az-700-vm" {
  name                = local.virtual_machine_config.vm_name
  resource_group_name = azurerm_resource_group.az-700-rg.name
  location            = azurerm_resource_group.az-700-rg.location
  size                = local.virtual_machine_config.size
  admin_username      = local.virtual_machine_config.user_name
  network_interface_ids = [
    azurerm_network_interface.az-700-vm-nic.id,
  ]

  admin_ssh_key {
    username   = local.virtual_machine_config.user_name
    public_key = file("../../Azure_keys/AZ700-VM-KEYS/public_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = local.virtual_machine_config.disk
  }

  source_image_reference {
    publisher = local.virtual_machine_config.image.publisher
    offer     = local.virtual_machine_config.image.offer
    sku       = local.virtual_machine_config.image.sku
    version   = local.virtual_machine_config.image.version
  }
}