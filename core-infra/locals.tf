locals {
  # Common tags to be assigned to all resources
  common_tags = {
    environment  = var.tag_environment
    team         = var.tag_team
    created_with = "Terraform"
    repository   = "git" #link kum tvoeto repo 
    product      = var.tag_product
  }
  # Naming convention to be used for resources
  # name = "${var.product}-${var.environment}"
}
