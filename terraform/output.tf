output "ec2_public_ip" {
  value = module.compute.public_ip
}


output "app_url" {
  value = module.compute.app_url
}