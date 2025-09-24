module "ec2" {
  source           = "./modules/ec2"
  instance_count   = 2
  ami              = var.ami
  instance_type    = var.instance_type
  subnet_ids       = [module.subnets.public_subnet_1_id, module.subnets.public_subnet_2_id]  
  security_group_id = module.security_groups.ec2_sg_id  
  target_group_arn = module.alb.target_group_arn       
}
