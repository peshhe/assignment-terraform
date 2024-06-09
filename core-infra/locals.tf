locals {
  # Common tags to be assigned to all resources
  common_tags = {
    environment  = var.tag_environment
    team         = var.tag_team
    created_with = "Terraform"
    repository   = "https://github.com/peshhe/assignment-terraform"
    product      = var.tag_product
  }
}
