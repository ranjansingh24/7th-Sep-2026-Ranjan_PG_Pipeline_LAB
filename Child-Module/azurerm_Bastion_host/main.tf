resource "azurerm_bastion_host" "bastion-chapra" {
    for_each = var.c-bas
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.group

    ip_configuration {
      name = each.value.ipname
      subnet_id = var.subnetids[each.value.subnetname]
      public_ip_address_id = var.pipid[each.value.pipname]
    }

  
}