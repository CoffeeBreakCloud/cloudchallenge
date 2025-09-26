resource "aws_instance" "ubuntu_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   =  var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = "CodeChallenger"
  associate_public_ip_address = true
  tags = {
    Name = "ubuntu-instance"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y git net-tools curl build-essential libssl-dev docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
    EOF
}

