variable "user" {
  description = "The username for the VM"
  type        = string
  default = "aj"
  
}

variable "pswd" {
  description = "The password for the SQL DB.. it will prompt for password in terminal"
  type        = string
  
}