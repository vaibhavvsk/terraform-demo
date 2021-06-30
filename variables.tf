variable "instance_type" {
  default = "t2.micro"
  type    = string
}
variable "ami" {
  type    = string
  default = "ami-0ad704c126371a549"
}