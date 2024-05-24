locals {
  butane_config = templatefile("${path.module}/node-exporter.yaml.tpl", { telemetry-path = random_uuid.telemetry-path.result })
}

resource "random_uuid" "telemetry-path" {}
