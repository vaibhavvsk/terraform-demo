resource "aws_key_pair" "sshkey" {
  key_name   = "pubkey"
  public_key = file("${path.module}/../ssh-key-pair/terraform_publickey.pub")
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
    security_groups  = ["sg-0d976bda3c224a248"]
    self             = false
    to_port          = 22
  }]

  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "All outgoing ports open"
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = ["${data.aws_ec2_managed_prefix_list.prefix_list.id}"]
    protocol         = "-1"
    security_groups  = ["sg-0d976bda3c224a248"]
    self             = false
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
    connection {
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("${path.module}/../ssh-key-pair/terraform_privatekey.pem")
    }
    inline = [
      "sudo apt update",
      "sudo apt -y upgrade",
      "sudo apt install curl"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo apt remove curl"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  tags = {
    "Name" = element(var.nodetags, count.index)
  }
}