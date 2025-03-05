variable "location" {
   description = "put region like eastus, westus etc"
   type = string
   default = "centralus"
}

variable "dns_servers" {
    type = list(string)
    # format of values = ["test", "test2"] ==, lis of strings
    # list of numbers = [1, 2, 3]
  default = ["10.0.0.56","10.0.0.45"]
}

variable "rg-name" {
  default = "TF-Lab-3"
  type = string
}

variable "tags" {
  type = map(string)
  description = "the values of tags exmample: {key1 = value1, key2 = value2}"
  default = {
    env = "prod"
  }
  
}
