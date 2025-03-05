module "vpc" {
  source         = var.vpc_module_source
  aws_region     = var.aws_region
  vpc_name       = var.vpc_name
  base_cidr      = var.base_cidr
  num_of_subnets = var.num_of_subnets
  vpc_labels     = var.vpc_labels
}

module "ec2_instance" {
  source             = var.ec2_module_source
  aws_region         = var.aws_region
  hostname           = var.hostname
  ssh_key_name       = var.ssh_key_name != "" ? var.ssh_key_name : null
  user_data          = var.user_data
  ami_filter         = var.ami_filter
  instance_type      = var.instance_type
  subnet_id          = random_shuffle.subnet.result[0]
  security_group_ids = module.vpc.security_group_id
  disksize           = var.disksize
  cloud_labels       = var.cloud_labels
}

resource "random_shuffle" "subnet" {
  input        = split(",", module.vpc.public_subnet_ids)
  result_count = 1
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "public_dns" {
  value = module.ec2_instance.public_dns
}

output "nginx_url" {
  value = "http://${module.ec2_instance.public_dns}"
}
