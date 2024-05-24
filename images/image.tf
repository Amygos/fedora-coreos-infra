resource "digitalocean_custom_image" "fcos" {
  name    = "fcos"
  url     = "https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/40.20240416.3.1/x86_64/fedora-coreos-40.20240416.3.1-digitalocean.x86_64.qcow2.gz"
  regions = ["ams3"]
  tags    = ["fedora-coreos"]
  distribution = "CoreOS"
}
