module "ssh_keys" {
  source = "./../../modules/ssh_keys"
}

module "node-exporter" {
  source = "./../../modules/node-exporter"
}

module "traefik" {
  source = "./../../modules/traefik"
  dynamic_config = {
    http = {
      routers = {
        test = {
          rule    = "path(`/echo`)"
          service = "echo-server"
        }
        metrics = {
          rule    = "Path(`/${module.node-exporter.telemetry-path}`)"
          service = "node-exporter"
        }
      }
      services = {
        echo-server = {
          loadBalancer = {
            servers = [
              { url = "http://localhost:8080" }
            ]
          }
        }
        node-exporter = {
          loadBalancer = {
            servers = [
              { url = "http://localhost:9100" }
            ]
          }
        }
      }
    }
  }
}

module "volume" {
  source     = "./../../modules/volume"
  name       = "state"
  size       = 2
  mountpoint = "/var"
  region     = var.region
  droplet_id = digitalocean_droplet.web.id
}

data "digitalocean_images" "fcos" {
  filter {
    key    = "tags"
    values = ["fedora-coreos"]
  }

}
# Create a DigitalOcean droplet with Ignition JSON as user_data
resource "digitalocean_droplet" "web" {
  name      = var.droplet_name
  region    = var.region
  size      = var.size
  image     = data.digitalocean_images.fcos.images.0.id
  user_data = data.ct_config.ignition.rendered
  ssh_keys  = [data.digitalocean_ssh_key.ssh_key.fingerprint]
}

# Convert the Butane configuration to Ignition using the ct provider
data "ct_config" "ignition" {
  content      = file("${path.module}/butane/echo-server.yaml")
  pretty_print = true
  strict       = true
  snippets = [
    module.volume.butane_config,
    module.traefik.butane_config,
    module.ssh_keys.butane_config,
    module.node-exporter.butane_config,
  ]
}

data "digitalocean_ssh_key" "ssh_key" {
  name = "Matteo"
}
