variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "eastus"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "index_document" {
  type        = string
  description = "The name of the index document. This is the webpage that will be served when a request is made to the root of the website."
  default     = "index.html"
  
}

variable "error_404_document" {
  type        = string
  description = "The name of the document to serve when a request is made for a resource that doesn't exist."
  default     = "404.html"
  
}