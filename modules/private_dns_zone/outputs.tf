output "internal_dns_zone_id" {
    value = azurerm_private_dns_zone.module_internaldns.id
}

output "internal_dns_zone_name" {
    value = azurerm_private_dns_zone.module_internaldns.name
}

output "external_dns_zone_id" {
    value = azurerm_private_dns_zone.module_externaldns.id
}

output "external_dns_zone_name" {
    value = azurerm_private_dns_zone.module_externaldns.name
}