locals {
  instance_key_name     = "kubespray"

  instance_type_bastion = "e-medium"
  instance_type_egress  = "e-medium"
  instance_type_cp      = "e-large8"
  instance_type_wk      = "e-large8"

  instance_count_cp = 3
  instance_count_wk = 2
}

#####
# Provider
#
provider "nifcloud" {
  region     = var.region
}

#####
# Data
#
data "terraform_remote_state" "elasticip" {
  backend = "local"
  
  config = {
    path = "${path.root}/../elasticip/terraform.tfstate"
  }
}

#####
# Module
#
module "k8s_infrastructure" {
  source = "ystkfujii/k8s-infrastructure/nifcloud"
  version = "0.0.3"

  availability_zone = var.availability_zone

  instance_key_name = local.instance_key_name

  elasticip_bastion = data.terraform_remote_state.elasticip.outputs.bastion
  elasticip_egress = data.terraform_remote_state.elasticip.outputs.egress

  instance_count_cp = local.instance_count_cp
  instance_count_wk = local.instance_count_wk

  instance_type_bastion = local.instance_type_bastion
  instance_type_egress = local.instance_type_egress
  instance_type_cp = local.instance_type_cp
  instance_type_wk = local.instance_type_wk
}


#####
# Security Group
#
resource "nifcloud_security_group_rule" "ssh_from_working_server" {
  security_group_names = [
    module.k8s_infrastructure.security_group_name.bastion,
  ]
  type        = "IN"
  from_port   = 22
  to_port     = 22
  protocol    = "TCP"
  cidr_ip     = var.working_server_ip
}