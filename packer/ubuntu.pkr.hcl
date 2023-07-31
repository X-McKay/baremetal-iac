# Packer Template to create an Ubuntu Server on Proxmox

source "null" "ansible-pre-provisioning" {
  communicator = "none"
}

build {
  sources = ["source.null.ansible-pre-provisioning"]
  provisioner "ansible" {
    playbook_file = "${path.root}/playbooks/pre-provisioning.yml"
    extra_arguments = [
      "--extra-vars",
      "user='${var.template_ssh_username}' password='${var.template_ssh_password}' ssh_folder='${var.template_ssh_key_output_folder}' ssh_key_name='${var.template_ssh_key_name}'"
    ]
  }
}

source "proxmox-iso" "ubuntu" {
  username                 = "${var.proxmox_username}"
  password                 = "${var.proxmox_password}"
  proxmox_url              = "${var.proxmox_url}"
  insecure_skip_tls_verify = "${var.proxmox_insecure_skip_tls_verify}"
  node                     = "${var.proxmox_node}"

  template_name        = "${var.template_name}"
  template_description = "${var.template_description}"
  os                   = "${var.template_os}"
  iso_url              = "${var.template_iso_url}"
  iso_checksum         = "${var.template_iso_checksum}"
  iso_storage_pool     = "${var.template_iso_storage_pool}"
  unmount_iso          = "${var.template_unmount_iso}"
  memory               = "${var.template_memory}"
  cores                = "${var.template_cores}"
  cpu_type             = "${var.template_cpu_type}"
  scsi_controller      = "${var.template_scsi_controller}"
  qemu_agent           = "${var.template_qemu_agent}"

  network_adapters {
    model  = "${var.template_network_model}"
    bridge = "${var.template_network_bridge}"
  }

  disks {
    disk_size         = "${var.template_disks_disk_size}"
    storage_pool      = "${var.template_disks_storage_pool}"
    storage_pool_type = "${var.template_disks_storage_pool_type}"
    type              = "${var.template_disks_type}"
  }

  http_directory = "output/http"
  boot_wait      = "3s"
  boot_command = [
    "<esc><wait><esc><wait><f6><wait><esc><wait>",
    "<bs><bs><bs><bs><bs>",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
    "--- <enter>"
  ]

  ssh_timeout  = "${var.template_ssh_timeout}"
  ssh_username = "${var.template_ssh_username}"
  ssh_password = "${var.template_ssh_password}"
}

build {
  sources = ["source.proxmox-iso.ubuntu"]

  provisioner "shell" {
    inline = [
      "echo 'Waiting for cloud-init...'",
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do sleep 1; done"
    ]
  }

  provisioner "ansible" {
    playbook_file = "${path.root}/playbooks/post-provisioning.yml"
  }
}
