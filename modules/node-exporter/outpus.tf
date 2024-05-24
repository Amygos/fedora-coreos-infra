output "butane_config" {
  description = "Butane configuration for SSH keys"
  value       = local.butane_config
}

output "telemetry-path" {
  description = "Path to the telemetry data"
  value       = random_uuid.telemetry-path.result
}
