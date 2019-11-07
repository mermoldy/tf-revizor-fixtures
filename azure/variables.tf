// secrets binding section
variable "scalr_azurerm_client_id" {}
variable "scalr_azurerm_client_secret" {}
variable "scalr_azurerm_subscription_id" {}
variable "scalr_azurerm_tenant_id" {}
variable "scalr_azurerm_environment" {}

// module section
variable "region" {}
variable "name" {}
variable "resource_group" {}
variable "instance_type" {}
variable "network" {}
variable "subnet_id" {}
variable "password" {}
variable "tags" {
  type = map(string)  
}
