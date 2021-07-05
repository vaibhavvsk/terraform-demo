resource "aws_key_pair" "sshkey" {
  key_name = "pubkey"
  # public_key = file("${path.module}/../ssh-key-pair/terraform_publickey.pub")
  public_key = var.mypublickey
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Enable ssh incoming port and all outgoing ports"

  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "SSH Port 22"
    from_port        = 22
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = ["${data.aws_ec2_managed_prefix_list.prefix_list.id}"]
    protocol         = "tcp"
    security_groups  = data.aws_security_groups.default.ids
    self             = true
    to_port          = 22
  }]

  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "All outgoing ports open"
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = ["${data.aws_ec2_managed_prefix_list.prefix_list.id}"]
    protocol         = "-1"
    security_groups  = data.aws_security_groups.default.ids
    self             = true
    to_port          = 0
  }]
}

resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.my-ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.sshkey.key_name
  count                  = 2
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    on_failure = continue
    connection {
      host = self.public_ip
      user = "ubuntu"
      #private_key = file("${path.module}/../ssh-key-pair/terraform_privatekey.pem")
      private_key = var.myprivatekey
    }
    inline = [
      "sudo apt update",
      "sudo ls -ltr"
    ]
  }

  # provisioner "remote-exec" {
  #   when       = destroy
  #   on_failure = continue

  #   connection {
  #     host = self.public_ip
  #     user = "ubuntu"
  #     //private_key = file("${path.module}/../ssh-key-pair/terraform_privatekey.pem")
  #     private_key = var.myprivatekey
  #   }
  #   inline = [
  #     "echo \"Destroy triggered\" "
  #   ]
  # }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  tags = {
    "Name" = element(var.nodetags, count.index)
  }
}