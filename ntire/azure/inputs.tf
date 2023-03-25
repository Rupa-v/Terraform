variable "location" {
  type        = string
  default     = "East Us"
  description = "location to creat resource"

}

variable "terraform_vnetsub" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "cidr range of vnet"

}

variable "subnet_names" {
  type    = list(string)
  default = ["app11", "web11", "db11", "app22", "web22", "db22"]

}