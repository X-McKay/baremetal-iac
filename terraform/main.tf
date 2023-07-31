terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.3.0"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.api_url
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
}

resource "tls_private_key" "virtual_machine_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "proxmox_vm_qemu" "ubuntu-vm" {
    depends_on = [
    tls_private_key.virtual_machine_keys
  ]
  count = 2
  name = "${var.proxmox_host}-${count.index + 1}"
  qemu_os = "other"
  target_node = var.proxmox_host
  sshkeys = tls_private_key.virtual_machine_keys.public_key_openssh

  clone = var.template_name
  full_clone  = "true"

  agent = 1
  os_type = "ubuntu"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size = "32G"
    type = "scsi"
    storage = "local-lvm"
    discard = "on"
    iothread = 0
  }

  network {
    model = "virtio"
    bridge = var.nic_name
  }


  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}