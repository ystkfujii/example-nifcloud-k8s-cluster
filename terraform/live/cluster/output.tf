output "control_plane_lb" {
  value = module.k8s_infrastructure.control_plane_lb
}

output "security_group_name" {
  description = "The security group used in the cluster"
  value = module.k8s_infrastructure.security_group_name
}

output "bastion_info" {
  description = "The bastion infomation in cluster"
  value       = module.k8s_infrastructure.bastion_info
}

output "egress_info" {
  description = "The egress infomation in cluster"
  value       = module.k8s_infrastructure.egress_info
}

output "worker_info" {
  description = "The worker infomation in cluster"
  value       = module.k8s_infrastructure.worker_info
}

output "control_plane_info" {
  description = "The control plane infomation in cluster"
  value       = module.k8s_infrastructure.control_plane_info
}