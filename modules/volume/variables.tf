variable "region" {
  description = "The region in which the resources will be deployed"
  default     = "ams3"
}

variable "name" {
  description = "The name of the resources"
  default     = "state"
}

variable "size" {
  description = "The size of the resources"
  default     = "1"
}

variable "droplet_id" {
  description = "The ID of the droplet to attach the volume to"
}

variable "mountpoint" {
  description = "The mountpoint of the volume"
  default     = "/var"
}
