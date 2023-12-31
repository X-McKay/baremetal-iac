variable "email" {
  type        = string
  description = "The email address to use for authenticating with Cloudflare"
}

variable "api_key" {
  type        = string
  description = "The API key to use for authenticating with Cloudflare"
}

variable "nomad_client_ips" {
  type        = set(string)
  description = "The IP addresses of the Nomad client nodes"
}

variable "nas_east_server_ip" {
  type        = string
  description = "The IP address of the synology NAS (east)"
}

variable "nas_west_server_ip" {
  type        = string
  description = "The IP address of the synology NAS (west)"
}