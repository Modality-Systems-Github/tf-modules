/*
 private dns
 ricardo.meechan@modalitysystems.com
*/

resource "azurerm_private_dns_zone" "module_internaldns" {
  name                = var.internaldomainname
  resource_group_name = var.resourcegroup
    tags = merge(var.tags, map("creation", timestamp()))

  lifecycle {
    ignore_changes = [tags["creation"]]
  }
}

resource "azurerm_private_dns_zone" "module_externaldns" {
  name                = var.externaldomainname
  resource_group_name = var.resourcegroup
      tags = merge(var.tags, map("creation", timestamp()))

  lifecycle {
    ignore_changes = [tags["creation"]]
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "module_internaldns_link" {
  name                  = "dnslink-${internaldomainname}" // TODO : Change to just dnslink
  resource_group_name = var.resourcegroup
  private_dns_zone_name = azurerm_private_dns_zone.module_internaldns.name
  virtual_network_id    = var.vnetid
  registration_enabled  = true
}
/*
resource "azurerm_private_dns_zone_virtual_network_link" "module_internaldns_link_dr" {
  name                  = "dnslink-dr" 
  resource_group_name = var.resourcegroup
  private_dns_zone_name = azurerm_private_dns_zone.module_internaldns.name
  virtual_network_id    = var.vnetid_dr
  registration_enabled  = true
}
*/
resource "azurerm_private_dns_zone_virtual_network_link" "module_externaldns_link" {
   name                  = "dnslink-${externaldomainname}" // TODO : Change to just dnslink
  resource_group_name = var.resourcegroup
  private_dns_zone_name = azurerm_private_dns_zone.module_externaldns.name
  virtual_network_id    = var.vnetid
  registration_enabled  = false
}
/*
resource "azurerm_private_dns_zone_virtual_network_link" "module_externaldns_link_dr" {
  name                  = "dnslink-dr"
  resource_group_name = var.resourcegroup
  private_dns_zone_name = azurerm_private_dns_zone.module_externaldns.name
  virtual_network_id    = var.vnetid_dr
  registration_enabled  = false
}
*/