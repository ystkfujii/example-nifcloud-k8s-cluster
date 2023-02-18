provider "nifcloud" {
  region = var.region
}

# Module
module "sshkey_uploader" {
  source  = "ystkfujii/sshkey-uploader/nifcloud"
  version = "0.0.1"

  key_name = "kubespray"
}

resource "null_resource" "store_private_key" {
  triggers = {
    private_key = module.sshkey_uploader.private_key
  }

  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}/out ; echo '${module.sshkey_uploader.private_key}' > ${path.cwd}/out/key ; chmod 0600 ${path.cwd}/out/key"
  }
}