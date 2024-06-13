module "network" {
  source = "./modules/network"

  vpc_cidr = "172.16.2.0/24"
  nat_interface_id = module.compute.nat_interface_id
}

module "compute" {
  source = "./modules/compute"

  vpc_cidr = module.network.vpc_cidr
  private_security_group = module.network.private_security_group
  public_security_group = module.network.public_security_group
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id = module.network.public_subnet_id

  worker_count = var.worker_count
  ami = var.ami
  key = var.key
  instance_type = var.instance_type
}