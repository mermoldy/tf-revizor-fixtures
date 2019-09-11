variable "region" {
  type = string
}
variable "instance_type" {
  type = string
  description = "sdfsdfsdfs"
}
variable "network" {
  type = string
}
variable "subnet" {
  type = string
}
variable "associate_public_ip" {
  type    = bool
  default = true
}
variable "tags" {
  type = "map"
}
