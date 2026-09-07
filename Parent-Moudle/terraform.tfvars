p-rgs = {
  rg1 = {
    name     = "rg-ranjan-dev-us"
    location = "East US"
  }
  rg2 = {
    name     = "rg-ranjan-prod-us"
    location = "East US"
  }
}
p-vnet = {
  vnet1 = {
    name          = "vnet-dev"
    location      = "eastus"
    group         = "rg-ranjan-dev-us"
    address_space = ["10.0.0.0/16"]
  }
}
p-sbn = {
  subnet1 = {
    name         = "subnet-pool-netflix"
    group        = "rg-ranjan-dev-us"
    network_name = "vnet-dev"
    prefixex     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name         = "subnet-pool-starbugs"
    group        = "rg-ranjan-dev-us"
    network_name = "vnet-dev"
    prefixex     = ["10.0.1.0/24"]
  }
  subnet3 = {
    name         = "AzureBastionSubnet"
    group        = "rg-ranjan-dev-us"
    network_name = "vnet-dev"
    prefixex     = ["10.0.2.0/26"]
  }
}
p-pip = {
  pip1 = {
    name     = "pipforbastion"
    location = "East US"
    group    = "rg-ranjan-dev-us"
    method   = "static"
  }
}

p-bas = {
  bastion = {
    name       = "bastionforchapra"
    location   = "East US"
    group      = "rg-ranjan-dev-us"
    ipname     = "ip-config-for-bastion"
    subnetname = "subnet3"
    pipname    = "pip1"
  }
}

p-nic = {
  nicnetfliex1 = {
    name      = "nic-netflix1"
    location  = "East US"
    group     = "rg-ranjan-dev-us"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet1"
  }
  nicnetfliex2 = {
    name      = "nic-netflix2"
    location  = "East US"
    group     = "rg-ranjan-dev-us"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet1"
  }
  nicstarbucks1 = {
    name      = "nic-starbucks1"
    location  = "East US"
    group     = "rg-ranjan-dev-us"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet2"
  }
  nicstarbucks2 = {
    name      = "nic-starbucks2"
    location  = "East US"
    group     = "rg-ranjan-dev-us"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet2"
  }
}

p-nsg = {
  vm-nsg1 = {
    name     = "ranjannsg-1"
    location = "East US"
    group    = "rg-ranjan-dev-us"
    inbound = {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

p-vm = {}



