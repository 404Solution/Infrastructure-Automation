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
    - `provider.tf`: Defines the provider values for the module.

2. **NSG Module (`modules/nsg`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

3. **VM Module (`modules/vm`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

4. **VMSS Module (`modules/vmss`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

5. **SQL Database Module (`modules/sql_database`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

### Example Configuration for Development Environment Azure

#### `environments/dev/terragrunt.hcl`

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
```

### Infrastructure Details AWS

- **Virtual Network (VPC)**: Configured with subnets for web, application, and database tiers.
- **Virtual Machine Scale Set (AutoScaling)**: Two VMs in the web tier with a Load Balancer and scaling capabilities.
- **Virtual Machine (EC2)**: One VM in the application tier.
- **RDS SQL Database**: Hosted in the database tier.
- **Network Security Group (NACLs)**: Configured with rules for each tier.



## Setup Instructions

1. Install Terraform and Terragrunt and AWS CLI.
2. Log in to AWS using the aws CLI: `aws configure`
3. Clone this repository and navigate to the project directory.
4. Initialize Terragrunt: `terragrunt init`
5. Plan the infrastructure deployment: `terragrunt plan`
6. Apply the configuration: `terragrunt apply`

## AWS

### Modules

1. **VNet Module (`modules/vnet`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

2. **NSG Module (`modules/nsg`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

3. **VM Module (`modules/vm`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

4. **VMSS Module (`modules/vmss`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

5. **SQL Database Module (`modules/sql_database`)**
    - `main.tf`: Defines the Virtual Network and subnets.
    - `variables.tf`: Defines the input variables for the module.
    - `outputs.tf`: Defines the output values for the module.
    - `backend.tf`: Defines the backend values for the module.
    - `provider.tf`: Defines the provider values for the module.

### Example Configuration for Development Environment AWS

#### `environments/dev/terragrunt.hcl`

```hcl
terraform {
  source = "../../modules/vm"
}

inputs = {
  region                      = "us-east-1"
  ami                         = "ami-0abcdef1234567890" 
  instance_type               = "t2.micro"
  instance_name               = "dev-vm"
  subnet_id                   = "subnet-12345678"      
  vpc_security_group_id       = "sg-12345678"         
  subnet_ids                  = ["subnet-12345678", "subnet-87654321"] 
  vpc_id                      = "vpc-12345678"        
}
```

### Azure Cost Estimation for Automated Infrastructure with Terraform

#### 1. **Virtual Network (VNet) and Subnets**
- **Virtual Network**: $0.0056 per hour per 100 IPs.
- **3 Subnets**: Included in the cost of the VNet.

#### 2. **Virtual Machines and Load Balancer**
- **VMs in the web tier (2 VMs Standard_DS1_v2)**:
  - **Cost per VM**: $0.060 per hour.
  - **Monthly cost (730 hours)**: 2 VMs x $0.060 x 730 = $87.60.
- **Load Balancer (Standard SKU)**: $0.025 per hour.
  - **Monthly cost**: $0.025 x 730 = $18.25.

#### 3. **Azure SQL Database**
- **Azure SQL Database (Standard S1)**:
  - **Monthly cost**: $30.00.

#### 4. **Network Security Group (NSG)**
- **NSGs**: No additional cost, included in the subnet implementation.

#### 5. **Public IP Address**
- **Public IP Address (Static)**: $3.65 per month.

### Monthly Cost Summary

| Resource                      | Monthly Cost (USD) |
|-------------------------------|--------------------|
| Virtual Network and Subnets   | $0.00              |
| 2 VMs                         | $87.60             |
| Load Balancer                 | $18.25             |
| Azure SQL Database (S1)       | $30.00             |
| Public IP Address             | $3.65              |
| **Total Monthly Cost**        | **$140.30**        |

### Virtual Network and Subnets

Here we are not including the NAT gateway in comparison to AWS

### AWS Cost Estimation for Automated Infrastructure with Terraform

#### 1. **Virtual Private Cloud (VPC), Subnets, and NAT Gateway**
- **Virtual Private Cloud (VPC)**: Free for the first 1,000 GB per month.
- **3 Public Subnets**: Included in the cost of the VPC.
- **3 Private Subnets**: Included in the cost of the VPC.
- **NAT Gateway**: $0.045 per hour plus $0.045 per GB data processed.
  - **Monthly cost**: $0.045 x 730 = $32.85.
  - **Data transfer cost (assuming 100 GB)**: $0.045 x 100 = $4.50.
  - **Total NAT Gateway cost**: $32.85 + $4.50 = $37.35.

#### 2. **Elastic Load Balancer (ELB)**
- **Load Balancer (Application Load Balancer)**: $0.0225 per Application Load Balancer-hour plus $0.008 per LCU-hour.
  - **Monthly cost**: (730 hours x $0.0225) + (730 hours x $0.008) = $21.90 + $5.84 = $27.74.

#### 3. **EC2 Instances**
- **EC2 Instances for Web Tier (2 t3.medium instances)**:
  - **Cost per instance**: $0.0416 per hour.
  - **Monthly cost (730 hours)**: 2 instances x $0.0416 x 730 = $60.80.

#### 4. **RDS Instance (MySQL)**
- **RDS db.t3.medium Single-AZ instance**:
  - **Cost per hour**: $0.038.
  - **Monthly cost (730 hours)**: $0.038 x 730 = $27.74.

#### 5. **Network Security Group (NSG)**
- **NSGs**: No additional cost.

#### 6. **Elastic IP Address**
- **Elastic IP Address**: $0.005 per hour if not associated with a running instance.
  - **Monthly cost**: $0.005 x 730 = $3.65.

### Monthly Cost Summary

| Resource                      | Monthly Cost (USD) |
|-------------------------------|--------------------|
| Virtual Private Cloud (VPC)   | $0.00              |
| 3 Public Subnets              | $0.00              |
| 3 Private Subnets             | $0.00              |
| NAT Gateway                   | $37.35             |
| 2 EC2 instances in web tier   | $60.80             |
| Application Load Balancer     | $27.74             |
| RDS instance (MySQL)          | $27.74             |
| Elastic IP Address            | $3.65              |
| **Total Monthly Cost**        | **$157.68**        |


