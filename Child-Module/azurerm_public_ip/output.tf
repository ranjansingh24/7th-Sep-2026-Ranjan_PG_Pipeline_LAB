output "pip-output" {
  value = {
    for k,v in azurerm_public_ip.pip-chapra : k=>v.id
  }
}