variable "instance_type" {
  default = "t2.micro"
  type    = string
}
variable "mypublickey" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFXpZRl6O4V34pwuZ8xRzt5Fdkee5AGHhTkwWjycRxJqEDfROlb7R7PNpY8ZK7HkJ7mhnnyeO6wIdaVxckVcDyPxrDhLe2ATIZmT6YknK2qBqJfVmhgl55g5YrhJtjtWid4SrVlH1rQY7nEgrnZEWN0xb9rFRfTRkcS1z48976wr35T2G5+E8X9Jiy3tZjeaZXkm1e7Ea49YqOzUw1FYqToidWUH2NZhvGXUonzmhdi4l/X9pGNwVejA6CorN9NhvX7EIdmumpdDDyOTsUT3PoGVS1ffj8a4GhP1HbhJ+dcF7KiFf9LksYQs1IAcStuAjgJIdxOLN+onX5iCLAJXa3"
}
variable "myprivatekey" {
  type    = string
  default = <<EOF
"-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAhV6WUZejuFd+KcLmfMUc7eRXZHnuQBh4U5MFo8nEcSahA30T
pW+0ezzaWPGSux5Ce5oZ58njusCHWlcXJFXA8j8aw4S3tgEyGZk+mJJytqgaiX1Z
oYJeeYOWK4SbY7VoneEq1ZR9a0GO5xIK52RFjdMW/axUX00ZHEtc+PPe+sK9+U9h
ufhPF/SYst7WY3mmV5JtXuxGuPWKjs1MNRWKk6InVlB9jWYbxl1KJ85oXYuJf1/a
RjcFXowOgqKzfTYb1+xCHZrpqXQw8jk7FE9z6BlUtX34/GuBoT9R24SfnXBeyohX
/S5LGELNSAHErbgI4CSHcTizfqJ1+YgiwCV2twIDAQABAoIBAFs4U8Yg2pkmNqOn
q/Ag/eV0bZXKk/uBASPghlX9lf/ydOSm8v4PhjlYaNu29y5GxyA1SYyxGLLOJoXS
1YBDqwHFya97IhA5hyPdHeRLHmzyU5xAgUKnoaipKNhBDetH0/NQY/TLaHEo2O4Q
+CZF/hDAFZSR/u9kE023+jJI0vVdqpZWxkGfhRn2rFAtm+WxIlnErpw9d8zdoovD
9gWv2oh5Fx0hRlxv36cPADzskuUfDjW+89RO9qhZsOhB1jryiBzENyqTIQkX9zD0
AcTz9KYk1qU3edowfB6nw3SeWLy/74v/oaqSk9gFYh9KcHngtm7rGsDpmH4tp99F
wfW2b4kCgYEAv4voJVl9qzl5trUg8NN2ILrRBxbVTXlZ4nm8KLP8I3/Q74cDLcT0
ygdi6DdXH5w7cqjI32uwx1WXyQOvP/YE1Qo+bRH4zF0S0kecDqYlFKCQHObW71ol
HgMHhHJsB4j/4aSadgkNoA/4VSKwG/xb0MNsB+ipzGeklZHNHWdKnLUCgYEAsj86
GnTVrqv0iIcVLdQ+e6oFrG502jlP2c55kT1GYcrzlYQnNFNel5Tq9IhAOvEUrL0T
zdlB+NfdhFjKdzUQAlNeRuioJFJdlmDyA3WKRP8TlnOFEU+/ZlvK+JcIFMxbFPva
w4eJDxN0bY21fYPdUo/5KrTVmRsmBntDvkaGlTsCgYAvSubNWfQaM32mq7/vVfaD
jDyRyIRvtXeI4E+hqRam2ScIDMivI0LhIsO72/YJ2vQekifOafNis/Je8ibx3tdA
ll/lZBuOsag0/PM99q2PEzmhuSj2PcaOS2cuv2WG0r+CwbZVUFTp4SeKNZ9PuZYd
zDI/HaXWzvwm5bHEAb29RQKBgEtc2jcnYNU6VOiInJbE3yowB7gQ94zwoGdJmjKj
QqfERFraBi1kdmEGkJSVKvsAxSoHw2DMU81fj4QOeoQORleFYh3+7mB1Bqa3FHwL
7Usgwephq0hXfGhNtTKHwN3yTSxBFAyJuJRMOHS9bpfD8gafYs0AqjLSvLAO2+SO
MwbTAoGAReMeLjRm1XlFrVp6WdBij/EheQ3sD08VDEnLmH6IRDbdDcr716U8UXTB
M6IC2Ql5It5Zq6LCZ39036jyMqs1l60XpzyPJPFMIbIRPBvufeEOp2Dyg5SVaBUw
S579T599it+lZpwkaKWGKZzce9cr2ShxkEuvxxiSRe5Nf1vfGfY=
-----END RSA PRIVATE KEY-----
EOF
}
variable "ami" {
  type    = string
  default = "ami-0ad704c126371a549"
}
variable "nodetags" {
  type    = list(any)
  default = ["Node1", "Node2"]
}