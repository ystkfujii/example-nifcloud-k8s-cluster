provider "nifcloud" {
  region = var.region
}

#####
# Elastic IP
#

resource "nifcloud_elastic_ip" "egress" {

  ip_type           = false
  availability_zone = var.availability_zone
  description       = "egress"
}

resource "nifcloud_elastic_ip" "bastion" {

  ip_type           = false
  availability_zone = var.availability_zone
  description       = "bastion server"
}
