# Terraform Local Modules

This Terraform project provisions an AWS infrastructure including a VPC, public subnet, Internet Gateway (IGW), 
and an EC2 instance using reusable modules.

## Module Description
Network Module: Provisions a VPC, public subnet, and an Internet Gateway (IGW) for enabling internet access to resources in the subnet.
EC2 Module: Provisions an EC2 instance within the public subnet and associates a public IP address.


```
.
├── network/
│   ├── main.tf             # VPC, subnet, IGW resources
│   ├── outputs.tf          # Outputs for VPC module (subnet IDs, VPC ID, etc.)
│   ├── variables.tf        # Input variables for the VPC module
├── ec2/
│   ├── main.tf             # EC2 instance resources
│   ├── outputs.tf          # Outputs for EC2 module (instance ID, public IP)
│   ├── variables.tf        # Input variables for the EC2 module
├── main.tf                 # Root module, calls network and EC2 modules
└── .gitignore              # Ignores sensitive files and local state
