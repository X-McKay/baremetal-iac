variable "template_ssh_username" {
  type    = string
  default = "svc"
}

variable "template_ssh_password" {
  type    = string
  sensitive = true
}

variable "template_ssh_key_output_folder" {
  type    = string
  default = "../output/ssh_keys"
}

variable "template_ssh_key_name" {
  type    = string
  default = "id_ed25519_ubuntu_packer"
}

variable "template_ssh_timeout" {
    type = string
    default =  "45m"
}

variable "proxmox_username" {
  type    = string
  default = "root@pve"
}

variable "proxmox_password" {
  type    = string
  sensitive = true
}

variable "proxmox_node" {
  type    = string
  default = "node"
}

variable "proxmox_url" {
  type    = string
  default = "https://0.0.0.0:8006/api2/json"
}

variable "proxmox_insecure_skip_tls_verify" {
  type    = bool
  default = true
}

variable "template_name" {
  type    = string
  default = "packer-ubuntu"
}
variable "template_description" {
  type    = string
  default = "Ubuntu 20.04 template built with packer"
}

variable "template_os" {
  type    = string
  default = "l26"
}

variable "template_iso_url" {
    type = string
    default = "https://releases.ubuntu.com/20.04/ubuntu-20.04.6-live-server-amd64.iso"
}

variable "template_iso_checksum" {
    type = string
    default = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
}

variable "template_iso_storage_pool" {
    type = string
    default = "local"
}

variable "template_unmount_iso" {
  type    = bool
  default = true
}

variable "template_memory" {
  type    = string
  default = 2048
}

variable "template_cores" {
  type    = string
  default = 2
}

variable "template_cpu_type" {
  type    = string
  default = "host"
}

variable "template_scsi_controller" {
  type    = string
  default = "virtio-scsi-pci"
}
variable "template_qemu_agent" {
  type    = bool
  default = true
}

variable "template_network_model" {
  type    = string
  default = "virtio"
}

variable "template_network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "template_disks_disk_size" {
  type    = string
  default = "25G"
}

variable "template_disks_storage_pool" {
  type    = string
  default = "local-lvm"
}

variable "template_disks_storage_pool_type" {
  type    = string
  default = "lvm"
}

variable "template_disks_type" {
  type    = string
  default = "virtio"
}
