# Read SSH key files from the directory
locals {

  ssh_keys_dir  = var.ssh_keys_dir == "" ? "${path.module}/keys/" : var.ssh_keys_dir
  ssh_key_files = fileset(local.ssh_keys_dir, "*.pub")
  ssh_key_paths = [for key in local.ssh_key_files : "${local.ssh_keys_dir}/${key}"]
  butane_config = templatefile("${path.module}/ssh-keys.yaml.tpl", { ssh_key_paths = local.ssh_key_paths })
}
