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

data "aws_region" "current" {}

data "aws_ec2_managed_prefix_list" "prefix_list" {
  name = "com.amazonaws.${data.aws_region.current.name}.dynamodb"
}

output "out_prefix_list" {
  value = data.aws_ec2_managed_prefix_list.prefix_list.id
}

data "aws_security_groups" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

output "default_security_groupID" {
  value = data.aws_security_groups.default.ids
}