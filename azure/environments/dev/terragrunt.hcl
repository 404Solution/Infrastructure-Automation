  terraform {
  source = "../../modules/vnet"
  }

  remote_state {
    backend = "azurerm"
    config = {
      resource_group_name  = "devResourceGroup"
      storage_account_name = "devterraformstatetest"
      container_name       = "tfstatedev"
      key                  = "dev/terraform.tfstate"
    }
  }

  # input module VNET

  inputs = {
    environment          = "dev"
    vnet_name            = "VPC-dev"
    address_space        = ["10.0.0.0/16"]
    location             = "East US"
    resource_group_name  = "devResourceGroup"
  } 

  # input module SQL_DATABASE
  /*
    inputs = {
    environment                = "dev"
    vnet_name                  = "devvnet"
    address_space              = ["10.0.0.0/16"]
    location                   = "East US"
    resource_group_name        = "devresourcegroup"
    instance_count             = 1
    admin_username             = "devadmin"
    admin_password             = "DevPassword1234!"
    subnet_id                  = "subnet_id_from_output"
    lb_backend_address_pool_id = "lb_backend_address_pool_id_from_output"
    health_probe_id            = "health_probe_id_from_output"
    sql_server_name            = "devsqlservertest"
    administrator_login        = "sqladmin"
    administrator_login_password = "DevSqlPassword1234!"
    database_name              = "devsqlservertest"
  } 
  */
  # input module NSG
  /*
  inputs = {
    resource_group_name = "devresourcegroup"
    location            = "East US"
    nsg_name            = "dev-nsg"
    address_space              = ["10.0.0.0/16"]
    vnet_name                  = "devvnet"
    security_rules = [
      {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }*/


  # Input module vm (vm1)

  /*
  inputs = {
    resource_group_name = "devresourcegroup"
    location            = "East US"
    vm_name             = "dev-vm"
    vm_size             = "Standard_DS1_v2"
    instance_count      = 2
    lb_backend_address_pool_id = "lb_backend_address_pool_id_from_output"
    health_probe_id            = "health_probe_id_from_output"
    admin_username      = "devadmin"
    admin_password      = "DevPassword1234!"
    subnet_id           = "/subscriptions/4e978dae-6a3e-46ff-ac0f-96e527c3b3fe/resourceGroups/devresourcegroup/providers/Microsoft.Network/virtualNetworks/VPC-dev/subnets/app" 
  } */



  # Input Module vmss (vm 2)
  /*
  inputs = {
    resource_group_name        = "devresourcegroup"
    location                   = "West US 2"
    vmss_name                  = "dev-vmss"
    vm_size                    = "Standard_DS1_v2"
    instance_count             = 2
    lb_backend_address_pool_id = "lb_backend_address_pool_id_from_output"
    health_probe_id            = "health_probe_id_from_output"
    admin_username             = "devadmin"
    admin_password             = "DevPassword1234!"
    subnet_id                  = "/subscriptions/4e978dae-6a3e-46ff-ac0f-96e527c3b3fe/resourceGroups/devresourcegroup/providers/Microsoft.Network/virtualNetworks/VPC-dev/subnets/app"
  }
  */