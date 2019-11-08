// secrets binding section
variable "scalr_azurerm_client_id" {}
variable "scalr_azurerm_client_secret" {}
variable "scalr_azurerm_subscription_id" {}
variable "scalr_azurerm_tenant_id" {}
variable "scalr_azurerm_environment" {}

// module section
variable "name" {}
variable "region" {}
variable "resource_group" {}
variable "instance_type" {}
variable "network" {}
variable "subnet_id" {}
variable "password" {}
variable "tags" {
  type = map(string)  
}
variable "name_instanse_1" {}
variable "region_instanse_1" {}
variable "resource_group_instanse_1" {}
variable "instance_type_instanse_1" {}
variable "network_instanse_1" {}
variable "subnet_id_instanse_1" {}
variable "password_instanse_1" {}
variable "tags_instanse_1" {
  type = map(string)  
}
