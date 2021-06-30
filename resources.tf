# ami-0a05821577033f94d is available in Mumbai reg
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.my-ubuntu.id
  instance_type = var.instance_type
}