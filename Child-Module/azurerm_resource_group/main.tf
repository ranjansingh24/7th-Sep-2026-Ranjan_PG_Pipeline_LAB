resource "azurerm_resource_group" "rg-chapra" {
    for_each = var.c-rgs
    name = each.value.name
    location = each.value.location
}