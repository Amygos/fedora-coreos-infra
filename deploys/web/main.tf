terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
    ct = {
      source  = "poseidon/ct"
    }
  }
}

provider "digitalocean" {
}

provider "ct" {
}

