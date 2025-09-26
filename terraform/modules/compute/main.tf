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
}

