# Azure/AWS Infrastructure Automation with Terraform

## Project Overview

This project automates the deployment of a scalable web application in Azure and AWS using Terraform. The infrastructure includes a Virtual Network, multiple Virtual Machines, a Load Balancer, and an Azure SQL Database.

## Infrastructure Details Azure

- **Virtual Network (VNet)**: Configured with subnets for web, application, and database tiers.
- **Virtual Machine Scale Set (VMSS)**: Two VMs in the web tier with a Load Balancer and scaling capabilities.
- **Virtual Machine (VM)**: One VM in the application tier.
- **Azure SQL Database**: Hosted in the database tier.
- **Network Security Group (NSG)**: Configured with rules for each tier.



## Setup Instructions

1. Install Terraform and Terragrunt and Azure CLI.
2. Log in to Azure using the Azure CLI: `az login`
3. Clone this repository and navigate to the project directory.
4. Initialize Terragrunt: `terragrunt init`
5. Plan the infrastructure deployment: `terragrunt plan`
6. Apply the configuration: `terragrunt apply`

## Azure

### Modules

1. **VNet Module (`modules/vnet`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the backend values for the module.

2. **NSG Module (`modules/nsg`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the backend values for the module.

3. **VM Module (`modules/vm`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the backend values for the module.

4. **VMSS Module (`modules/vmss`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the backend values for the module.

5. **SQL Database Module (`modules/sql_database`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the backend values for the module.

### Example Configuration for Development Environment

`environments/dev/terragrunt.hcl`

```hcl
terraform {
  source = "../../modules/vm"
}

inputs = {
  resource_group_name = "devresourcegroup"
  location            = "West US 2"
  vm_name             = "dev-vm"
  vm_size             = "Standard_DS1_v2"
  admin_username      = "devadmin"
  admin_password      = "DevPassword1234!"
  subnet_id           = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/devresourcegroup/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/dev-subnet"
}






## Cost Estimate


## Screenshot
![Deployed Resources]



Cost Estimation
Use the Azure Pricing Calculator to estimate the cost of the following resources:

Virtual Network
Virtual Machines (2 in web tier, 1 in app tier)
Load Balancer
Azure SQL Database
Public IP Address
