resource "azurerm_virtual_machine_scale_set" "web" {
  name                = "webVMSS"
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_policy_mode = "Manual"
  sku {
    name     = "Standard_DS1_v2"
    tier     = "Standard"
    capacity = var.instance_count
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name_prefix = "webvmss"
    admin_username       = var.admin_username
    admin_password       = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "webVMSSNetworkProfile"
    primary = true

    ip_configuration {
      name                                   = "internal"
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.lb_backend_address_pool_id]
      primary                                = true
    }
  }

  health_probe_id = var.health_probe_id
}
