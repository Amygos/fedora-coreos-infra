variable "droplet_name" {
  description = "The name of the DigitalOcean droplet"
  type        = string
  default     = "fcos-web"
}

variable "region" {
  description = "The region to deploy the droplet in"
  type        = string
  default     = "ams3"
}

variable "size" {
  description = "The size of the droplet"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "The image to use for the droplet"
  type        = string
  default     = "fedora-coreos-stable"
}

variable "ssh_keys_dir" {
  description = "Directory containing SSH public keys"
  type        = string
  default     = "./ssh_keys"
}

variable "hostname" {
  description = "The hostname to set in the Butane file"
  type        = string
  default     = "localhost"
}

