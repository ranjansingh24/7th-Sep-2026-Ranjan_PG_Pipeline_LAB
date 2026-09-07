resource "azurerm_subnet" "sn-chapra" {
   for_each = var.c-sbn
    name = each.value.name
    resource_group_name = each.value.group
    virtual_network_name = each.value.network_name
    address_prefixes = each.value.prefixex
  
}