terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.3.0"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.api_url
  pm_api_token_id     = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure     = true
}