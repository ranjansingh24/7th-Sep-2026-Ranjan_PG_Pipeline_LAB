# resource "azurerm_virtual_machine" "netflixvm1" {
#   for_each              = var.c-vm
#   name                  = each.value.name
#   location              = each.value.location
#   resource_group_name   = each.value.group
#   network_interface_ids = each.value.network_interface_ids
#   vm_size               = lookup(each.value, "size", "Standard_D2s_v3")

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }

#   storage_os_disk {
#     name              = "osdisk-${each.value.name}"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }

#   os_profile {
#     computer_name  = each.value.name
#     admin_username = "adminranjan"
#     admin_password = "admin@123456"
#   }

#   os_profile_linux_config {
#     disable_password_authentication = false
#   }

#   tags = {
#     environment = "staging"
#   }
# }