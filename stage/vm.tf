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
  vm_name                = "EU2-STG-CON01"
  vm_size                = "Standard_B2ms"
  vm_count               = 1
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "WindowsServer"
  os_sku                 = "2012-R2-Datacenter"
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
  avset                  = "LOC-ENV-APP-AVSET"
  bootdiagsa             = "digasaname"
  bootdiagsa_rsg         = "LOC-ENV-RSG-ALL"
  vm_name                = "LOC-ENV-APP0"
  vm_size                = "Standard_D2s_v3"
  vm_count               = 2
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "WindowsServer"
  os_sku                 = "2016-Datacenter"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "UTC"
  admin_password         = var.admin_password
}

module "db_vms" {
  source                 = ".//linux_vm"
  buildby                = "Racker Name"
  buildticket            = "Ticket-Number"
  environment            = "Production"
  location               = "East US 2"
  rsg                    = "LOC-ENV-RSG-INS"
  vnet                   = "LOC-ENV-VNET"
  subnet                 = "LOC-ENV-VNET-INS"
  subnet_rsg             = "LOC-ENV-RSG-ALL"
  accelerated_networking = false
  avset                  = "LOC-ENV-INS-AVSET"
  bootdiagsa             = "digasaname"
  bootdiagsa_rsg         = "LOC-ENV-RSG-ALL"
  vm_name                = "LOC-ENV-DB0"
  vm_size                = "Standard_D2s_v3"
  vm_count               = 2
  os_publisher           = "Canonical"
  os_offer               = "UbuntuServer"
  os_sku                 = "16.04-LTS"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "UTC"
  admin_password         = var.admin_password
}

#Example of using the VM module for Availability Zones

module "web_vms_avzone" {
  source                 = ".//win_vm_avzone"
  buildby                = "Racker Name"
  buildticket            = "Ticket-Number"
  environment            = "Production"
  location               = "East US 2"
  rsg                    = "LOC-ENV-RSG-DMZ"
  vnet                   = "LOC-ENV-VNET"
  subnet                 = "LOC-ENV-VNET-DMZ"
  subnet_rsg             = "LOC-ENV-RSG-ALL"
  accelerated_networking = false
  vm_name                = "EU2-PRD-WEB0"
  vm_size                = "Standard_F4s"
  vm_count               = 4
  os_publisher           = "MicrosoftWindowsServer"
  os_offer               = "WindowsServer"
  os_sku                 = "2016-Datacenter"
  vm_disk_sku            = "Premium_LRS"
  vm_timezone            = "Eastern Standard Time"
  admin_password         = var.admin_password
}

# If building VMs in Availability Zone below is an example of how to break down disks into different zones. 

resource "azurerm_managed_disk" "web_vms_disk1" {
  name                 = "EUS-PRD-WEB01-disk01"
  location             = var.location
  resource_group_name  = "module"
  create_option        = "Empty"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "128"
  zones                = ["1"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "web_vms_disk1_attach" {
  managed_disk_id    = azurerm_managed_disk.web_vms_disk1.id
  virtual_machine_id = element(module.web_vms.vm_ids, 0)
  lun                = "0"
  caching            = "None"
}

resource "azurerm_managed_disk" "web_vms_disk2" {
  name                 = "EUS-PRD-WEB02-disk01"
  location             = var.location
  resource_group_name  = "module"
  create_option        = "Empty"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "128"
  zones                = ["2"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "web_vms_disk2_attach" {
  managed_disk_id    = azurerm_managed_disk.web_vms_disk2.id
  virtual_machine_id = element(module.web_vms.vm_ids, 1)
  lun                = "0"
  caching            = "None"
}

resource "azurerm_managed_disk" "web_vms_disk3" {
  name                 = "EUS-PRD-WEB03-disk01"
  location             = var.location
  resource_group_name  = "module"
  create_option        = "Empty"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "128"
  zones                = ["1"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "web_vms_disk3_attach" {
  managed_disk_id    = azurerm_managed_disk.web_vms_disk3.id
  virtual_machine_id = element(module.web_vms.vm_ids, 2)
  lun                = "0"
  caching            = "None"
}

resource "azurerm_managed_disk" "web_vms_disk4" {
  name                 = "EUS-PRD-WEB04-disk01"
  location             = var.location
  resource_group_name  = "module"
  create_option        = "Empty"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "128"
  zones                = ["2"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "web_vms_disk4_attach" {
  managed_disk_id    = azurerm_managed_disk.web_vms_disk4.id
  virtual_machine_id = element(module.web_vms.vm_ids, 3)
  lun                = "0"
  caching            = "None"
}

