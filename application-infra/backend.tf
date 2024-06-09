# Where the Terraform State file is:
terraform {
  backend "azurerm" {
    resource_group_name  = "ResourceGroup-for-TF-State"
    storage_account_name = "tfstate07062024sa"
    container_name       = "storage-container-for-tfstate"
    key                  = "terraform.tfstate"
  }
}
