locals {
  virtual_machine_config = {
    vm_name   = "az-700-vm-machine"
    user_name = "sathsang"
    size      = "Standard_B1s"
    disk      = "Standard_LRS"
    image = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "8_5-gen2"
      version   = "latest"}
  }
}