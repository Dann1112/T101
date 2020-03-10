#############################
# IaaS VM
#############################

module "con_vms" {
  source                 = ".//win_vm"
  buildby                = var.buildby
  buildticket            = var.buildticket
  environment            = var.environment
  location               = var.location
  rsg                    = var.con_rsg_name
  vnet                   = var.vnet_name
  subnet                 = var.con_subnet_name
  subnet_rsg             = var.vnet_rsg_name
  accelerated_networking = false
  avset                  = "EU2-STG-CON-AVSET"
  bootdiagsa             = "----------------"
  bootdiagsa_rsg         = var.mgmt_rsg_name
  vm_name                = "EU2-STG-CON0"
  vm_size                = "Standard_B2ms"
  vm_count               = 1
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "sql2014sp3-ws2012r2-byol"
  os_sku                 = "standard"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "Central Standard Time"
  admin_password         = var.admin_password
}

module "app_vms" {
  source                 = ".//win_vm"
  buildby                = var.buildby
  buildticket            = var.buildticket
  environment            = var.environment
  location               = var.location
  rsg                    = var.app_rsg_name
  vnet                   = var.vnet_name
  subnet                 = var.app_subnet_name
  subnet_rsg             = var.vnet_rsg_name
  accelerated_networking = false
  avset                  = "EU2-STG-APP-AVSET"
  bootdiagsa             = "----------------"
  bootdiagsa_rsg         = var.mgmt_rsg_name
  vm_name                = "EU2-STG-APP0"
  vm_size                = "Standard_B2ms"
  vm_count               = 1
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "2012-R2-Datacenter"
  os_sku                 = "standard"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "Central Standard Time"
  admin_password         = var.admin_password
}

module "db_vms" {
  source                 = ".//win_vm"
  buildby                = var.buildby
  buildticket            = var.buildticket
  environment            = var.environment
  location               = var.location
  rsg                    = var.db_rsg_name
  vnet                   = var.vnet_name
  subnet                 = var.db_subnet_name
  subnet_rsg             = var.vnet_rsg_name
  accelerated_networking = false
  avset                  = "EU2-STG-DB-AVSET"
  bootdiagsa             = "----------------"
  bootdiagsa_rsg         = var.mgmt_rsg_name
  vm_name                = "EU2-STG-DB0"
  vm_size                = "Standard_B2ms"
  vm_count               = 1
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "sql2014sp3-ws2012r2-byol"
  os_sku                 = "standard"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "Central Standard Time"
  admin_password         = var.admin_password
}
