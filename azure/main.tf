provider "azurerm" {
  client_id = var.scalr_azurerm_client_id
  client_secret = var.scalr_azurerm_client_secret
  subscription_id = var.scalr_azurerm_subscription_id
  tenant_id = var.scalr_azurerm_tenant_id
  environment =  var.scalr_azurerm_environment
}

resource "azurerm_virtual_machine" "Tf-test-instanse" {
  location = var.region
  name = var.name
  network_interface_ids = var.network_interface
  resource_group_name = var.resource_group
  vm_size = var.instance_type
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  

  os_profile {
    admin_username = var.name
    computer_name = var.name
    admin_password = var.password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    owner = "revizor"  
  }
  }
