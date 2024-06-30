# Azure/AWS Infrastructure Automation with Terraform

## Project Overview

This project automates the deployment of a scalable web application in Azure and AWS using Terraform. The infrastructure includes a Virtual Network, multiple Virtual Machines, a Load Balancer, and an Azure SQL Database.

## Infrastructure Details

- **Virtual Network (VNet)**: Configured with subnets for web, application, and database tiers.
- **Virtual Machine Scale Set (VMSS)**: Two VMs in the web tier with a Load Balancer and scaling capabilities.
- **Virtual Machine (VM)**: One VM in the application tier.
- **Azure SQL Database**: Hosted in the database tier.
- **Network Security Group (NSG)**: Configured with rules for each tier.

## Setup Instructions

1. Install Terraform and Azure CLI.
2. Log in to Azure using the Azure CLI: `az login`
3. Clone this repository and navigate to the project directory.
4. Initialize Terraform: `terraform init`
5. Plan the infrastructure deployment: `terraform plan`
6. Apply the configuration: `terraform apply`

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
