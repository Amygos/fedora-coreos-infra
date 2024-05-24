resource "digitalocean_volume" "state" {
  region                   = var.region
  name                     = var.name
  size                     = var.size
  initial_filesystem_label = var.name
  initial_filesystem_type  = "xfs"
}

resource "digitalocean_volume_attachment" "state" {
  droplet_id = var.droplet_id
  volume_id  = digitalocean_volume.state.id
}

locals {
  butane_config = templatefile("${path.module}/volume.yaml.tpl", {
    label     = digitalocean_volume.state.initial_filesystem_label
    size      = digitalocean_volume.state.size
    mountpoint = var.mountpoint
  })
}
