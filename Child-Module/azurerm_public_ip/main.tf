resource "azurerm_public_ip" "pip-chapra" {
    for_each = var.c-pip
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.group
   allocation_method   = "Static"
  sku                 = "Standard"
  
}