output "subnetid" {
    value = {
        for k,v in azurerm_subnet.sn-chapra : k=> v.id
    }
  
}