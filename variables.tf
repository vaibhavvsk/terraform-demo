variable "instance_type" {
  default = "t2.micro"
  type    = string
}
variable "mypublickey" {
  type      = string
  sensitive = true
}
variable "myprivatekey" {
  type      = string
  sensitive = true
}
variable "ami" {
  type    = string
  default = "ami-0ad704c126371a549"
}
variable "nodetags" {
  type    = list(any)
  default = ["Node1", "Node2"]
}