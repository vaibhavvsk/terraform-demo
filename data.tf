data "aws_ami" "my-ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430"]
  }
  filter {
    name   = "image-type"
    values = ["machine"]
  }
}

output "Ubuntu_AMI" {
  value       = data.aws_ami.my-ubuntu.id
  description = "value"
}

