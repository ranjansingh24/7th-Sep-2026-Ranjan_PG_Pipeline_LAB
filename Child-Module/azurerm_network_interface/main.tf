resource "azurerm_network_interface" "nic-chapra" {
    for_each = var.c-nic
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.group

  ip_configuration {
   name = each.value.ipcname
    private_ip_address_allocation = each.value.add-alloc
    subnet_id = var.subnetid[each.value.subnetid]
  }
}
