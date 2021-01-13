

variable "internaldomainname" {
  description = "Internal DNS Name used for server to server resolution"
  type = string
}

variable "externaldomainname" {
  description = "External DNS Name used for app fateway to server resolution"
  type = string
}

variable "resourcegroup" {
  description = "Resource Group that the resource should reside in"
  type = string
}

variable "vnetid" {
  description = "VNET ID to link"
  type = string
}

variable "vnetid_dr" {
  description = "DR VNET ID to link"
  type = string
}


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map
}


/*


variable "internaldomainname" {
  description = "Name for the diagnostic setting"
  type = string
  default = "modality-sbd-default"
}


variable "logs" {
  description = "List of logs"
  type = list(string)
}



*/