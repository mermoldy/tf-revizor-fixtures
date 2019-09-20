variable "region" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "network" {
  type = string
}
variable "subnet" {
  type = string
}
variable "associate_public_ip" {
  type    = bool
  default = false
}
variable "tags" {
  type = "map"
}
