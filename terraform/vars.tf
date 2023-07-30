variable "ssh_key" {
  default = "your_public_ssh_key_here"
}

variable "proxmox_host" {
    default = "proxmox_host_name"
}

variable "template_name" {
    default = "ubuntu-base"
}

variable "nic_name" {
    default = "vmbr0"
}

variable "vlan_num" {
    default = "0"
}

variable "api_url" {
    default = "https://0.0.0.0:8006/api2/json"
}

variable "token_secret" {
}

variable "token_id" {
}