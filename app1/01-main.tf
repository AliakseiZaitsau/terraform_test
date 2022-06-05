# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "1.2.2"
  # Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.17"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
  }
}

#Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}