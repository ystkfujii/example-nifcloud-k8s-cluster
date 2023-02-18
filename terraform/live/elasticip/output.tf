output "egress" {
  value = nifcloud_elastic_ip.egress.public_ip
}

output "bastion" {
  value = nifcloud_elastic_ip.bastion.public_ip
}
