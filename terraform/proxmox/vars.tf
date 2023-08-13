variable "proxmox_host" {
  type        = string
  description = "Hostname of machine with Proxmox installed"
}

variable "template_name" {
  type        = string
  description = "Name of Proxmox template used for VMs"
  default     = "ubuntu-base"
}

variable "nic_name" {
  type        = string
  description = "Name of Network Interface Card"
  default     = "vmbr0"
}

# variable "vlan_num" {
#   type        = string
#   description = "Number for Virtual Local Area Network"
#   default     = "0"
# }

variable "api_url" {
  type        = string
  description = "Proxmox API url"
  default     = "https://0.0.0.0:8006/api2/json"
}

variable "token_secret" {
  type        = string
  description = "Token secret for Proxmox access"
}

variable "token_id" {
  type        = string
  description = "ID associated with Proxmox token"
}