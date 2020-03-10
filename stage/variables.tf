/* Configure Azure Provider and declare all the Variables that will be used in Terraform configurations */
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = ">=2.0"
  features        {}
}

###################
# GENERAL DETAILS #
###################

variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}

variable "buildby" {
  description = "Name of the builder."
  default     = "Daniel Manrique"
}

variable "buildticket" {
  description = "Ticket Number for the build"
  default     = "03102020"
}

variable "environment" {
  description = "Prod,QA,STG,DEV,etc."
  default     = "STG"
}

variable "location" {
  description = "Azure region for the environment."
  default     = "East US 2"
}


###################
# RESOURCE GROUPS #
###################

variable "con_rsg_name" {
  description = "Name of the Contpaq azure resource group."
  default     = "EU2-STG-CON"
}

variable "app_rsg_name" {
  description = "Name of the App azure resource group."
  default     = "EU2-STG-APP"
}

variable "db_rsg_name" {
  description = "Name of the Database azure resource group."
  default     = "EU2-STG-DB"
}

variable "vnet_rsg_name" {
  description = "Name of the VNET azure resource group."
  default     = "EU2-STG-VNET"
}

variable "mgmt_rsg_name" {
  description = "Name of the Management azure resource group."
  default     = "EU2-STG-MGMT"
}

###########
# NETWORK #
###########

variable "vnet_name" {
  description = "name for the vnet."
  default     = "EU2-VNET01"
}

variable "vnet_address_space" {
  description = "address range for vnet."
  default     = ["172.16.193.64/26"]
}

variable "con_subnet_name" {
  description = "Name of the Contpaq subnet"
  default     = "EU2-VNET01-STG-CON"
}

variable "con_subnet_range" {
  description = "IP range for Contpaq subnet"
  default     = "172.16.193.64/28"
}

variable "app_subnet_name" {
  description = "Name of the App subnet"
  default     = "EU2-VNET01-STG-APP"
}

variable "app_subnet_range" {
  description = "IP range for App subnet"
  default     = "172.16.193.96/28"
}

variable "db_subnet_name" {
  description = "Name of the DB subnet"
  default     = "EU2-VNET01-STG-CON"
}

variable "db_subnet_range" {
  description = "IP range for DB subnet"
  default     = "172.16.193.80/28"
}

variable "rbast_subnet_range" {
  description = "IP range for bastion subnet"
  default     = "172.16.192.0/27"
}

#######
# VMs #
#######

variable "admin_password" {
  description = "password for all VMs"
}

