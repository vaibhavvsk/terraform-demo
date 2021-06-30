# ami-0a05821577033f94d is available in Mumbai reg
resource "aws_instance" "myec2" {
   ami = var.ami
   instance_type = var.instance_type
}