# IN DEVELOPMENT

I would think twice before attempting to run any of this code, or copying any patterns.

This repository is a work in progress, primarily a playground, and has not been thoroughly tested.

Use at your own risk.

# Create Proxmox templates using Packer

Creates a standard base ubuntu iso for broad use, and saves the template in Proxmox.
Template is built using Packer, which configured using cloud-init and ansible .

```
bin/build-iso
```

# Provision Proxmox VMs using Terraform

Provision n virtual machines on a Proxmox host using Terraform.

```
bin/build-vm
```

# Destroy Proxmox VMs

Destroys all Proxmox VMs provisioned via Terraform.

```
bin/destroy-vm
```

# Credit / Inspiration

[Justin P.'s packer-proxmox-ubuntu2004 repository](https://github.com/justin-p/packer-proxmox-ubuntu2004/tree/main)