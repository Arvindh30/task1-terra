module "ec2_instance" {
  source = "./modules/ec2_instance"
  key_name = var.key_name
  sg_name_val = var.sg_name_val
  ami_value = var.ami_value
  instance_type_value = var.instance_type_value
  volume_size = var.volume_size
  volume_type = var.volume_type
  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules
}