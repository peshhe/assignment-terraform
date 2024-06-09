# ----------------------------------------------------------------
# Variables for resource names:
# ----------------------------------------------------------------

variable "rg_app" {
  type        = string
  description = "The name of the Resource Group for the webapp"
}

variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry"
}

variable "rg_iam" {
  type        = string
  description = "The name of the Resource Group for Service Princcipal and other IAM purposes"
}

variable "sp_name" {
  type        = string
  description = "The name of the Service Principal"
}

variable "fw_rule_name" {
  type        = string
  description = "The name of the Firewall rule for PostgreSQL DataBase Server"
}

variable "db_username" {
  type        = string
  description = "The admin username to login to the DataBase Server"
}

variable "db_password" {
  type        = string
  description = "The password to the admin username of the DataBase Server"
}

variable "db_postgre_db_name" {
  type        = string
  description = "The name of the PostgreSQL DataBase"
}

variable "db_postgre_server_name" {
  type        = string
  description = "The name of the PostgreSQL DataBase Server"
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

# ----------------------------------------------------------------
# Variables values for initial Terrraform setup:
# ----------------------------------------------------------------

variable "region" {
  type        = string
  description = "The location of the datacenter"
}
