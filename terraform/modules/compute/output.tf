output "public_ip" {
value = aws_instance.ubuntu_instance.public_ip
}


output "app_url" {
value = "http://${aws_instance.ubuntu_instance.public_ip}:3000"
}