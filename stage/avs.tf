module "con_avset" {
  source      = ".//availability_set"
  buildby     = var.buildby
  buildticket = var.buildticket
  environment = var.environment
  location    = var.location
  rsg         = var.con_rsg_name
  vm_avset    = "EU2-STG-CON-AVSET"
}

module "app_avset" {
  source      = ".//availability_set"
  buildby     = var.buildby
  buildticket = var.buildticket
  environment = var.environment
  location    = var.location
  rsg         = var.app_rsg_name
  vm_avset    = "EU2-STG-APP-AVSET"
}

module "db_avset" {
  source      = ".//availability_set"
  buildby     = var.buildby
  buildticket = var.buildticket
  environment = var.environment
  location    = var.location
  rsg         = var.db_rsg_name
  vm_avset    = "EU2-STG-DB-AVSET"
}