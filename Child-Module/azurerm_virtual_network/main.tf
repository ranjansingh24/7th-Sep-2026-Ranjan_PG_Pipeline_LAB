resource "azurerm_virtual_network" "vnet-chapra" {
    for_each = var.c-vnet
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.group
    address_space = each.value.address_space
  
  
}
