resource "azurerm_network_security_group" "nsg-chapra" {
  for_each = var.c-nsg

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.group

  security_rule {
    name                       = each.value.inbound.name
    priority                   = each.value.inbound.priority
    direction                  = each.value.inbound.direction
    access                     = each.value.inbound.access
    protocol                   = each.value.inbound.protocol
    source_port_range          = each.value.inbound.source_port_range
    destination_port_range     = each.value.inbound.destination_port_range
    source_address_prefix      = each.value.inbound.source_address_prefix
    destination_address_prefix = each.value.inbound.destination_address_prefix
  }
}