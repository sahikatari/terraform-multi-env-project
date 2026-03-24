module "vpc" {
  source = "./modules/vpc"
  env    = var.env
  
}

module "sg" {
  source      = "./modules/sg"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  extra_ports = var.extra_ports
}

module "ec2" {
  source         = "./modules/ec2"
  env            = var.env
  instance_type  = var.instance_type
  sg_id          = module.sg.sg_id
  subnet_id      = module.vpc.subnet_id
}

module "s3" {
  source          = "./modules/s3"
  env             = var.env
  
}