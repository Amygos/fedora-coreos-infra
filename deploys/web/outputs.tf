# Output the droplet IP address
output "droplet_ip" {
  value = digitalocean_droplet.web.ipv4_address
}

output node-exporter_path {
  value = module.node-exporter.telemetry-path
}

