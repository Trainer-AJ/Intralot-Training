variable "location" {
  
}

variable "dns_servers" {
    type = list(string)
    # format of values = ["test", "test2"] ==, lis of strings
    # list of numbers = [1, 2, 3]
}
