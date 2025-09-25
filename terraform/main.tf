module "network" {
  source = "./modules/network"
}


module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id

}


module "compute" {

  source        = "./modules/compute"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  sg_id         = module.security.sg_id
}