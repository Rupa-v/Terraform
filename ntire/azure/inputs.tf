variable "location" {
  type        = string
  default     = "East Us"
  description = "location to creat resource"

}

variable "terraform_vnet1225" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "cidr range of vnet"

}