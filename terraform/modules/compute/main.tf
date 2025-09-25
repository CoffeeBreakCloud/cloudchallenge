resource "aws_instance" "ubuntu_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   =  var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true


  tags = {
    Name = "ubuntu-instance"
  }
}

##Create private key

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "./.ssh/terraform_rsa"
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "./.ssh/terraform_rsa.pub"
}

resource "aws_key_pair" "deployer" {
  key_name   = "ubuntu_ssh_key"
  public_key = tls_private_key.ssh_key.public_key_openssh

  provisioner "local-exec" { # Create a "ubuntu_ssh_key.pem" to your computer!!
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > ./ubuntu_ssh_key.pem"
  }
}