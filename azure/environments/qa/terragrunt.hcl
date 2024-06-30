terraform {
source = "../../modules/vnet"
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "qaResourceGroup"
    storage_account_name = "qaterrraformstatetest"
    container_name       = "tfstate"
    key                  = "qa/terraform.tfstate"
  }
}

inputs = {
  environment          = "qa"
  vnet_name            = "qaVNet"
  address_space        = ["10.0.0.0/16"]
  location             = "East US"
  resource_group_name  = "qaResourceGroup"
}
