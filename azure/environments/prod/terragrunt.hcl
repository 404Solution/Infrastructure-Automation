terraform {
  source = "../../modules/vnet"
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "prodResourceGroup"
    storage_account_name = "prodterraformstatetest"
    container_name       = "tfstate"
    key                  = "prod/terraform.tfstate"
  }
}

inputs = {
  environment          = "prod"
  vnet_name            = "prodVNet"
  address_space        = ["10.0.0.0/16"]
  location             = "East US"
  resource_group_name  = "prodResourceGroup"
}
