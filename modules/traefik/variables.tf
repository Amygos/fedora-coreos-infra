variable "dynamic_config" {
  type = map(any)
  default = {
    http = {
      routers = {
        test = {
          rule    = "path(`/test`)"
          service = "ping@internal"
        }
      }
    }
  }
  description = "traefik dynamic configuration"
}
