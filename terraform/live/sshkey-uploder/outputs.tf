output "private_key" {
  description = "The generated private key"
  value       = module.sshkey_uploader.private_key
  sensitive   = true
}