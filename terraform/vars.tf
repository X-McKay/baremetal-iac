# variable "proxmox_ssh_key" {
#   type        = string
#   description = "Public SSH key for Proxmox"
# }

variable "proxmox_host" {
  type        = string
  description = "Hostname of machine with Proxmox installed"
}

variable "proxmox_template_name" {
  type        = string
  description = "Name of Proxmox template used for VMs"
  default     = "ubuntu-base"
}

variable "proxmox_nic_name" {
  type        = string
  description = "Name of Network Interface Card"
  default     = "vmbr0"
}

# variable "proxmox_vlan_num" {
#   type        = string
#   description = "Number for Virtual Local Area Network"
#   default     = "0"
# }

variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API url"
  default     = "https://0.0.0.0:8006/api2/json"
}

variable "proxmox_token_secret" {
  type        = string
  description = "Token secret for Proxmox access"
}

variable "proxmox_token_id" {
  type        = string
  description = "ID associated with Proxmox token"
}

variable "cloudflare_email" {
  type        = string
  description = "The email address to use for authenticating with Cloudflare"
}

variable "cloudflare_api_key" {
  type        = string
  description = "The API key to use for authenticating with Cloudflare"
}

variable "tailscale_api_key" {
  type        = string
  description = "The API key to use for authenticating with the Tailscale API"
}

variable "tailscale_tailnet" {
  type        = string
  description = "The Tailnet to use"
}

variable "tailscale_nas_east_name" {
  type        = string
  description = "Tailscale name of NAS with tailnet address"
}

variable "tailscale_nas_west_name" {
  type        = string
  description = "Tailscale name of NAS with tailnet address"
}

variable "tailscale_client_prefix" {
  type        = string
  description = "Prefix for tailscale nodes to be considered clients"
}
