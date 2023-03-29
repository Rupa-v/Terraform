variable "location" {
  type        = string
  default     = "East Us"
  description = "location to creat resource"

}

variable "ntier_vnet_info" {
  type = object({
    terraform_vnetsub = list(string),
    subnet_names      = list(string),

  })


  default = {
    terraform_vnetsub = ["192.168.0.0/16"]
    subnet_names      = ["app11", "web11", "db11", "app22", "web22", "db22"]

  }
}