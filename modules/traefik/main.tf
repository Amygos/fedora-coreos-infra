locals {
  butane_config = templatefile("${path.module}/traefik.yaml.tpl", { dynamic_config = var.dynamic_config })
}
