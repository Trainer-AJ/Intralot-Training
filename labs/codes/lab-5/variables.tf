variable "rg_map" {
  type = map(string)
}

variable "tags" {
  default     = { environment = "Production", owner = "DevOps Team", creator = "Terraform" }
  type        = map(string)
  description = "Give vaules in the format  environment = \"Production\""
  # Escape double quotes in the format = \" VALUE \" which eqauls to "VALUE"
}