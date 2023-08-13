variable "api_key" {
  type        = string
  description = "The API key to use for authenticating with the Tailscale API"
}

variable "tailnet" {
  type        = string
  description = "The Tailnet to use"
  default     = "x-mckay.github"
}

variable "nas_east_name" {
  type        = string
  description = "Tailscale name of NAS with tailnet address"
}

variable "nas_west_name" {
  type        = string
  description = "Tailscale name of NAS with tailnet address"
}

variable "client_prefix" {
  type        = string
  description = "Prefix for tailscale nodes to be considered clients"
}