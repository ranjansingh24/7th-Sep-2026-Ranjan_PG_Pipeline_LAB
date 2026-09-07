module "rg-creation" {
  source = "../Child-Module/azurerm_resource_group"
  c-rgs  = var.p-rgs

}
module "vnet-creation" {
  depends_on = [module.rg-creation]
  source     = "../Child-Module/azurerm_virtual_network"
  c-vnet     = var.p-vnet
}
module "subnet-creation" {
  depends_on = [module.rg-creation, module.vnet-creation]
  source     = "../Child-Module/azurerm_subnet"
  c-sbn      = var.p-sbn

}
module "pip-creation" {
  depends_on = [module.rg-creation]
  source     = "../Child-Module/azurerm_public_ip"
  c-pip      = var.p-pip

}
module "bastion-creation" {
  depends_on = [module.rg-creation, module.pip-creation, module.subnet-creation]
  source     = "../Child-Module/azurerm_Bastion_host"
  c-bas      = var.p-bas
  subnetids  = module.subnet-creation.subnetid
  pipid      = module.pip-creation.pip-output


}
module "nsg-creation" {
  depends_on = [module.rg-creation]
  source     = "../Child-Module/azurerm_network_security_group"
  c-nsg      = var.p-nsg

}

module "nic-creation" {
  depends_on = [module.rg-creation, module.subnet-creation]
  source     = "../Child-Module/azurerm_network_interface"
  c-nic      = var.p-nic
  subnetid   = module.subnet-creation.subnetid
}


# module "vm-creation" {

#   depends_on = [module.nic-creation]

#   source = "../Child-Module/azurerm_virtual_machine"

#   c-vm = {
#     for k, v in var.p-vm :
#     k => merge(v, {
#       network_interface_ids = [
#         module.nic-creation.nic_ids[v.nic_key]
#       ]
#     })
#   }
# }

