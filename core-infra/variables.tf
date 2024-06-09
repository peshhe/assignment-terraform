# ----------------------------------------------------------------
# Variables values for initial Terrraform setup:
# ----------------------------------------------------------------

variable "region" {
  type        = string
  description = "The location of the datacenter"
}

variable "rg_tfstate" {
  type        = string
  description = "The name of the Resource Group for the 'Terraform State' file"
}

variable "sa_tfstate" {
  type        = string
  description = "The name of the Storage Account for the 'Terraform State' file"
}

variable "sc_tfstate" {
  type        = string
  description = "The name of the Storage Container for the 'Terraform State' file"
}


# ----------------------------------------------------------------
# Variables for tags:
# ----------------------------------------------------------------

variable "tag_environment" {
  type        = string
  description = "The tag for the Environment"
}

variable "tag_team" {
  type        = string
  description = "The tag for the Team"
}

variable "tag_product" {
  type        = string
  description = "The tag for the Product"
}
