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
