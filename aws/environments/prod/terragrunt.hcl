terraform {
  source = "../../modules/vnet"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

inputs = {
  environment          = "prod"
  vnet_name            = "prodVNet"
  address_space        = ["10.0.0.0/16"]
  location             = "us-east-1"
  resource_group_name  = "prodResourceGroup"
}
