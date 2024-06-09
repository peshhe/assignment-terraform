# Configure the Azure provider block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  # Terraform version:
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
